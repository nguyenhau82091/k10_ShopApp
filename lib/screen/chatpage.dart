import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:k10_shopapp/api/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );


  Future<void> _sendMessage(String text) async {
    try {
      final response = await http.post(
        Uri.parse(API_CHAT), // API endpoint để gửi tin nhắn
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': _user.id,
          'text': text,
        }),
      );

      if (response.statusCode == 201) {
        print('Message sent');
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xffc89595),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          theme: const DefaultChatTheme(
            inputBorderRadius: BorderRadius.all(Radius.circular(15)),
            inputBackgroundColor: Color(0xffc89595),
            inputTextColor: Colors.white,
            primaryColor: Color(0xffc89595),
            secondaryColor: Color(0xffc89595),
            sendButtonIcon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),

        ),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'new_message_id', // Replace with a unique ID
      text: message.text,
    );

    _addMessage(textMessage);
    _sendMessage(message.text); // Gửi tin nhắn qua API
  }


  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}
