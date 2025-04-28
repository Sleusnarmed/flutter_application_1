import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
//sendMessage

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(
      text: "Por haberte ido te irás directo a especial",
      fromWho: FromWho.me,
    ),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    //Notifica a provider que algo cambio
    notifyListeners();
  }
}
