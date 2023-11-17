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
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];
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

    socket.on('chat message', (data) {
      // Listen for incoming messages and update the state
      setState(() {
        messages.add(data);
      });
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void sendMessage() {
    String message = messageController.text;
    String room = 'USER2';
    if (message.isNotEmpty && socket.connected) {
      socket.emit('sendMessage', {
        'message': message,
        'roomName': room,
      });
      // Update the state to display the sent message
      setState(() {
        messages.add(message);
      });
      messageController.text = '';
    } else {
      print(
          'Error: Message not sent. Socket not connected or message is empty.');
    }
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
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: messages[index].startsWith('You: ')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: messages[index].startsWith('You: ')
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft: messages[index].startsWith('You: ')
                              ? Radius.circular(16.0)
                              : Radius.circular(0.0),
                          bottomRight: messages[index].startsWith('You: ')
                              ? Radius.circular(0.0)
                              : Radius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextField(
                      controller: messageController,
                      decoration:
                          InputDecoration(hintText: 'Enter your message'),
                    ),
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
