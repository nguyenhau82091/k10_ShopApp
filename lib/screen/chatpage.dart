import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    connectAndListen();
  }

  void connectAndListen() {
    socket = IO.io('http://54.196.170.115:9001',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void sendMessage() {
    String message = _messageController.text;
    String room = "USER2";

    Map<String, dynamic> messageData = {
      "roomName": room,
      "message": {
        "position": "right",
        "type": "text",
        "text": message,
        "date": DateTime.now().toUtc().toIso8601String(),
        "owner": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36",
      },
    };

    socket.emit('sendMessage', messageData);

    _messageController.text = '';
    print("Sent a message: $messageData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trò Chuyện Cùng Admin'),
        backgroundColor: Color(0xffc89595),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Enter your message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    socket.dispose(); // Đóng kết nối khi widget bị dispose
    super.dispose();
  }
}
