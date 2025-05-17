import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

typedef MessageStateCallback = void Function(String msg);

class Signaling {
  // define stun servers
  Map<String, dynamic> configuration = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
        ],
      },
    ],
  };

  RTCPeerConnection? peerConnection;

  String? roomId;
  String? currentRoomText;

  RTCDataChannel? dataChannel;
  MessageStateCallback? onMessageReceived;

  Future<String> createRoom(String callerEmailAddress, String calleeEmailAddress,
  ) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference roomRef = db.collection('rooms').doc();

    print('Create PeerConnection with configuration: $configuration');
    peerConnection = await createPeerConnection(configuration);

    // for chat
    RTCDataChannelInit dataChannelDict = RTCDataChannelInit();
    dataChannelDict.ordered = true;

    dataChannel = await peerConnection?.createDataChannel(
      "chat",
      dataChannelDict,
    );

    dataChannel?.onMessage = (RTCDataChannelMessage message) {
      print("Received message: ${message.text}");
      onMessageReceived?.call(message.text);
    };
    // end chat code

    registerPeerConnectionListeners();

    // Code for collecting ICE candidates below
    var callerCandidatesCollection = roomRef.collection('callerCandidates');

    peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      print('Got candidate: ${candidate.toMap()}');
      callerCandidatesCollection.add(candidate.toMap());
    };
    // Finish Code for collecting ICE candidate

    peerConnection!.onIceConnectionState = (RTCIceConnectionState state) {
      print('ICE connection state: $state');
      if (state == RTCIceConnectionState.RTCIceConnectionStateConnected) {
        print('✅ ICE connection is established!');
      }
    };

    // Add code for creating a room
    RTCSessionDescription offer = await peerConnection!.createOffer();
    await peerConnection!.setLocalDescription(offer);
    print('Created offer: $offer');

    Map<String, dynamic> roomWithOffer = {'offer': offer.toMap()};

    await roomRef.set(roomWithOffer);
    var roomId = roomRef.id;
    print('New room created with SDK offer. Room ID: $roomId');
    currentRoomText = 'Current room is $roomId - You are the caller!';
    // Created a Room

    // send notification to callee
    final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
    final result = await functions.httpsCallable('sendCallNotification').call({
      "callerEmailAddress": callerEmailAddress,
      "calleeEmailAddress": calleeEmailAddress,
      "roomId": roomId,
    });

    // Listening for remote session description below
    roomRef.snapshots().listen((snapshot) async {
      print('Got updated room: ${snapshot.data()}');
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      if (peerConnection?.getRemoteDescription() != null &&
          data['answer'] != null) {
        var answer = RTCSessionDescription(
          data['answer']['sdp'],
          data['answer']['type'],
        );
        print("Someone tried to connect");
        await peerConnection?.setRemoteDescription(answer);
      }
    });
    // Listening for remote session description above

    // Listen for remote Ice candidates below
    roomRef.collection('calleeCandidates').snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          Map<String, dynamic> data = change.doc.data() as Map<String, dynamic>;
          print('Got new remote ICE candidate: ${jsonEncode(data)}');
          peerConnection!.addCandidate(
            RTCIceCandidate(
              data['candidate'],
              data['sdpMid'],
              data['sdpMLineIndex'],
            ),
          );
        }
      });
    });
    // Listen for remote ICE candidates above
    return roomId;
  }

  void registerPeerConnectionListeners() {
    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print('ICE gathering state changed: $state');
    };

    peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      print('Connection state change: $state');
    };

    peerConnection?.onSignalingState = (RTCSignalingState state) {
      print('Signaling state change: $state');
    };

    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print('ICE connection state change: $state');
    };
  }

  void sendMessage(String msg) {
    if (dataChannel != null) {
      print('Sent message: $msg');
      dataChannel!.send(RTCDataChannelMessage(msg));
    }
  }
}
