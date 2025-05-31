import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                //color: Color(0xFFE1E1E2),
              ),
              child: Text(
                "Hello, what can i do for you, you can book appointment directly",
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 25, right: 20),
                decoration: BoxDecoration(
                  color: Colors.pink.shade300
                ),
                child: Text(
                  "Hello Doctor, Are you there?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ),
      ],
    );
  }
}
