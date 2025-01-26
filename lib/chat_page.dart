import 'package:flutter/material.dart';
import 'chatbot.dart'; // Import the chatbot logic

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key); // Added key parameter

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final List<Map<String, String>> _messages = []; // Stores both user and bot messages

  void _sendMessage() async {
    String message = _textController.text;
    if (message.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": message});
      _textController.clear();
    });

    try {
      String response = await generateText(message);
      setState(() {
        _messages.add({"role": "bot", "text": response});
      });
    } catch (e) {
      setState(() {
        _messages.add({"role": "bot", "text": "Error: Could not process the request."});
      });
    }
  }

  Widget _buildMessage(Map<String, String> message) {
    bool isUser = message["role"] == "user";
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message["text"]!,
          style: TextStyle(color: isUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
