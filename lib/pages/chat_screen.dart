import 'package:ehop_app/pages/video_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_sample.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.pink.shade800,
          leadingWidth: 30,
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Dr. Doctor Name",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8, right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoScreen()),
                  );
                },
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoScreen()),
                  );
                },
                child: Icon(
                  Icons.video_call_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 8),
        itemBuilder: (context, index) => ChatSample(),
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.emoji_emotions_outlined,
                size: 30,
                color: Colors.amber
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/1.4,
                child: Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.send,
                size: 30,
                color: Colors.pink.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
