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
    final Size screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    double screenWidth = screenSize.width > 600 ? 600 : screenSize.width;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenSize.height,
              color: theme.primaryColor,
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: RTCVideoView(_remoteRenderer)),
              ),
            ),

            Positioned(
              bottom: 40,
              right: 20,
              child: Container(
                width: screenWidth * 0.3,
                height: screenSize.height * 0.3,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: RTCVideoView(_localRenderer, mirror: true),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.videocam,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          print('Video button pressed');
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          print('Mic button pressed');
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(
                          Icons.call_end,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          print('Hangup button pressed');
                          signaling.hangUp(_localRenderer);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
