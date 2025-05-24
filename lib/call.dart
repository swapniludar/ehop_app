import 'package:ehop_app/comm/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:synchronized/synchronized.dart';

class CallInitiatePage extends StatefulWidget {
  const CallInitiatePage({super.key});

  @override
  CallInitiatePageState createState() => CallInitiatePageState();
}

class CallInitiatePageState extends State<CallInitiatePage> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  bool callInitiated = false;
  TextEditingController textEditingController = TextEditingController(text: '');
  final _lock = Lock();

  @override
  void initState() {
    _initCall();
    super.initState();
  }

  Future<void> _initCall() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();

    signaling.openUserMedia(_localRenderer, _remoteRenderer);
    setState(() {});

    _localRenderer.onFirstFrameRendered = () async {
      await _lock.synchronized(() async {
        print("Local video rendered for the first time!");
        if (callInitiated) {
          print("Call already initiated");
        } else {
          if (_localRenderer.videoWidth > 0 && _localRenderer.videoHeight > 0) {
            print("✅ First frame likely rendered (via onResize)");
            roomId = await signaling.createRoom(
              _remoteRenderer,
              "swapnil.udar@gmail.com",
              "dhanashri.udar@gmail.com",
            );
            textEditingController.text = roomId!;
            print("Call initiated");
            setState(() {
              callInitiated = true;
            });
          }
        }
      });
    };

    _localRenderer.onResize = () async {
      await _lock.synchronized(() async {
        if (callInitiated) {
          print("Call already initiated");
        } else {
          if (_localRenderer.videoWidth > 0 && _localRenderer.videoHeight > 0) {
            print("✅ First frame likely rendered (via onResize)");
            roomId = await signaling.createRoom(
              _remoteRenderer,
              "swapnil.udar@gmail.com",
              "dhanashri.udar@gmail.com",
            );
            textEditingController.text = roomId!;
            print("Call initiated");
            setState(() {
              callInitiated = true;
            });
          }
        }
      });
    };

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demonstrate peer to peer audio & Video all")),
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  signaling.hangUp(_localRenderer);
                },
                child: Text("Hangup"),
              ),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
