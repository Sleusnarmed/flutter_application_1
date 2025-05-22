import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/presentation/Widgets/chat/her_message_bubble.dart';


class ChatProvider extends ChangeNotifier{

  //Controlador qeue maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [

  ];


  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    if(text.trim().isEmpty) return;
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //Detectar si el usuario hizo una pregunta
    if(text.endsWith('?')) {
      herReply();
    }

    //Notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async{
    //Animación de scrolleo
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //offset: posición del máximo scroll posible
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      //Rebote al final de la animación
      curve: Curves.easeOut);
  }

  //Crea la respuesta de ella
  Future<void> herReply() async {
    //Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    
    //Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    //Notificar a Provider los cambios
    notifyListeners();

    //Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}