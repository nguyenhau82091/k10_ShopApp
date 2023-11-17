import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:k10_shopapp/widget/my_textInput.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

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
    // Connect to the socket and set up event listeners
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

  Future<String> getUserAgent() async {
    // Fetch the user agent using an HTTP request
    var response = await http.get(Uri.parse('https://httpbin.org/user-agent'));
    if (response.statusCode == 200) {
      // Parse the response JSON to get the user agent
      Map<String, dynamic> responseData = json.decode(response.body);
      return responseData['user-agent'];
    } else {
      throw Exception('Failed to get user agent');
    }
  }

  void sendMessage() async {
    // Send a text message
    String message = messageController.text;
    String room = "USER2";

    try {
      String owner = await getUserAgent();

      Map<String, dynamic> messageData = {
        "roomName": room,
        "message": {
          "position": "right",
          "type": "text",
          "text": message,
          "date": DateTime.now().toUtc().toIso8601String(),
          "owner": owner,
        },
      };

      socket.emit('sendMessage', messageData);
      setState(() {
        messages.add(message);
      });
      messageController.text = '';
      print("Sent a message: $messageData");
    } catch (e) {
      print("Error getting user agent: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trò Chuyện Cùng Admin',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xffc89595),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final reversedIndex = messages.length - 1 - index;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: messages[reversedIndex].startsWith('You: ')
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: messages[reversedIndex].startsWith('You: ')
                            ? Colors.blue
                            : const Color.fromARGB(255, 202, 131, 131),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft:
                              messages[reversedIndex].startsWith('You: ')
                                  ? Radius.circular(16.0)
                                  : Radius.circular(0.0),
                          bottomRight:
                              messages[reversedIndex].startsWith('You: ')
                                  ? Radius.circular(0.0)
                                  : Radius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        messages[reversedIndex],
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
                    child: MyTextInput(
                      controller: messageController,
                      hintText: 'Nhập tin nhắn',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xffc89595), size: 40),
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
    socket.dispose();
    super.dispose();
  }
}
