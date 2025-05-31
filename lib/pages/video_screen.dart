import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

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
                child: const Center(child: Text('Remote Screen Share')),
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
                child: const Center(child: Text('Local Screen Share')),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.videocam, color: Colors.white, size: 30),
                            onPressed: () {
                              print('Video button pressed');
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: const Icon(Icons.mic, color: Colors.white, size: 30),
                            onPressed: () {
                              print('Mic button pressed');
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: const Icon(Icons.call_end, color: Colors.red, size: 30),
                            onPressed: () {
                              print('Hangup button pressed');
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
