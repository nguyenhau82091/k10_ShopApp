import 'package:flutter/foundation.dart';
import 'package:k10_shopapp/model/chat_model.dart';


class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  addNewMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}