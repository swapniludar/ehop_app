import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehop_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: HomeScreen()));
}

class CallScreen extends StatefulWidget {
  final String roomId;
  final bool isCaller;

  const CallScreen({super.key, required this.roomId, required this.isCaller});

  @override
  CallScreenState createState() => CallScreenState();
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _roomIdController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio/Video call home")),
      body: Column(
        children: [
          TextField(
            controller: _roomIdController,
            decoration: InputDecoration(labelText: 'Room ID'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                      CallScreen(
                        roomId: _roomIdController.text,
                        isCaller: true,
                      ),
                ),
              );
            },
            child: Text('Create Call'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                      CallScreen(
                        roomId: _roomIdController.text,
                        isCaller: false,
                      ),
                ),
              );
            },
            child: Text('Join Call'),
          ),
        ],
      ),
    );
  }
}

class CallScreenState extends State<CallScreen> {
  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _initializeRenderers();
    _createPeerConnection();
    _setupSignaling();
    _requestPermissions();
    print("State initialized");
  }

  Future<void> _requestPermissions() async {
    await [
      Permission.camera,
      Permission.microphone,
    ].request();
  }

  void _initializeRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  Future<void> _createPeerConnection() async {
    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });
    _localRenderer.srcObject = _localStream;

    Map<String, dynamic> configuration = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    };
    _peerConnection = await createPeerConnection(configuration);

    _peerConnection!.onIceCandidate = (candidate) {
      firestore
          .collection('rooms')
          .doc(widget.roomId)
          .collection('candidates')
          .add({
        'candidate': candidate.candidate,
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
      });
    };

    _peerConnection!.onAddTrack = (stream, track) {
      _remoteRenderer.srcObject = stream;
    };

    _localStream!.getTracks().forEach(
      (track) => _peerConnection!.addTrack(track, _localStream!),
    );
  }

  void _setupSignaling() {
    firestore.collection('rooms').doc(widget.roomId).snapshots().listen((
        snapshot,) async {
      if (snapshot.exists) {
        var data = snapshot.data();
        if (widget.isCaller) {
          if (data!['answer'] != null &&
              (await _peerConnection!.getRemoteDescription()) == null) {
            await _peerConnection!.setRemoteDescription(
              RTCSessionDescription(
                data['answer']['sdp'],
                data['answer']['type'],
              ),
            );
          }
        } else {
          if (data!['offer'] != null &&
              (await _peerConnection!.getRemoteDescription()) == null) {
            await _peerConnection!.setRemoteDescription(
              RTCSessionDescription(
                data['offer']['sdp'],
                data['offer']['type'],
              ),
            );
            var answer = await _peerConnection!.createAnswer();
            await _peerConnection!.setLocalDescription(answer);
            firestore.collection('rooms').doc(widget.roomId).update({
              'answer': {'sdp': answer.sdp, 'type': answer.type},
            });
          }
        }
      }
    });

    firestore
        .collection('rooms')
        .doc(widget.roomId)
        .collection('candidates')
        .snapshots()
        .listen((snapshot) {
      snapshot.docChanges.forEach((change) async {
        if (change.type == DocumentChangeType.added) {
          print("ICE candidate added to peer connection");
          var data = change.doc.data();
          var candidate = RTCIceCandidate(
            data!['candidate'],
            data['sdpMid'],
            data['sdpMLineIndex'],
          );
          await _peerConnection!.addCandidate(candidate);
        }
      });
    });
  }

  void _makeCall() async {
    var offer = await _peerConnection!.createOffer();
    await _peerConnection!.setLocalDescription(offer);
    firestore.collection('rooms').doc(widget.roomId).update({
      'callerId': "1234567890",
      'offer': {'sdp': offer.sdp, 'type': offer.type},
      // 'answer': {'sdp': null, 'type': null},
    });
    print("Offer written to DB");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isCaller ? 'Caller - Video Call' : 'Callee - Video Call',
        ),
      ),
      body: Column(
        children: [
          Expanded(child: RTCVideoView(_localRenderer)),
          Expanded(child: RTCVideoView(_remoteRenderer)),
          if (widget.isCaller)
            ElevatedButton(onPressed: _makeCall, child: Text('Make Call')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }
}
