import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: "jijihaha", fromWho: FromWho.hers),
    Message(text: "lmfao", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // Trim only leading and trailing spaces while keeping internal spaces
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    ); // Keep original text with internal spaces
    messageList.add(newMessage);

    // Print the current count of messages
    print('Flutter: Cantidad de mensajes: ${messageList.length}');

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
