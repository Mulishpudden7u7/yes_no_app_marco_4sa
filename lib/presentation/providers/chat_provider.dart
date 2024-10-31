import 'package:flutter/material.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "HOLA ADER", fromWho: FromWho.me),
    Message(text: "¿LLORAS OOR QUE REPROBARAS?", fromWho: FromWho.me)
  ];
  //controlador para manejar el scroll
  final ScrollController chatScrollController = ScrollController();

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agrega un elemento a lista messagelist
    messageList.add(newMessage);
    //notifica si algo de provider cambio
    notifyListeners();
    //mueve el scroll
    moveScrollToBottom();
  }

//el futur es una promesa
  Future<void> moveScrollToBottom() async {
    //un pequeño atraso en la animacion para garantizar que siempre
    //se vera aun cuando se envien mensajes cortos y rapido
    await Future.delayed(const Duration(seconds: 1));
    chatScrollController.animateTo(
        //mover el scroll lo mas que se pueda, pociscion de la animacion
        //offset :pocisicon de la animacion
        //MaxcontrollerExtend primer linea
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
