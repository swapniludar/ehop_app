import 'package:ehop_app/call.dart';
import 'package:ehop_app/comm/chat_signaling.dart';
import 'package:flutter/material.dart';

class ChatInitiatePage extends StatefulWidget {
  const ChatInitiatePage({super.key});

  @override
  ChatInitiatePageState createState() => ChatInitiatePageState();
}

class ChatInitiatePageState extends State<ChatInitiatePage> {
  Signaling signaling = Signaling();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    signaling.createRoom("swapnil.udar@gmail.com", "dhanashri.udar@gmail.com");

    signaling.onMessageReceived = ((msg) {
      setState(() {
        _messages.add(ChatMessage(msg, false));
      });
    });
    super.initState();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    signaling.sendMessage(text);
    setState(() {
      _messages.add(ChatMessage(text, true));
      _controller.clear();
    });
  }

  Future<void> _call() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CallInitiatePage()),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demonstrate peer to peer audio & Video all")),
      body: Column(
        children: [
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment:
                      msg.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: msg.isSentByMe ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(msg.msg),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _sendMessage, child: Text("Send")),
                ElevatedButton(onPressed: _call, child: Text("Call")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String msg;
  final bool isSentByMe;

  ChatMessage(this.msg, this.isSentByMe);
}
