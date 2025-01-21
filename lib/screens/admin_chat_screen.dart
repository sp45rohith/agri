import 'package:flutter/material.dart';

class AdminChatScreen extends StatefulWidget {
  const AdminChatScreen({Key? key}) : super(key: key);

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'admin', 'message': _controller.text});
        _messages.add({'sender': 'user', 'message': "This is a placeholder response from the user."});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/uzhavan.png'), // Replace with the desired admin avatar image path
            ),
            SizedBox(width: 10),
            Text("Uzhavan"),
          ],
        ),
        backgroundColor: const Color(0xFF00796B),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[_messages.length - 1 - index];
                bool isAdminMessage = message['sender'] == 'admin';
                return Align(
                  alignment: isAdminMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: _buildMessageBubble(message['message']!, isAdminMessage),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Type a message",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: const Color(0xFF00796B),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isAdminMessage) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: isAdminMessage ? const Color(0xFFDCF8C6) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isAdminMessage ? const Radius.circular(12) : const Radius.circular(0),
          bottomRight: isAdminMessage ? const Radius.circular(0) : const Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isAdminMessage ? Colors.black : Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}
