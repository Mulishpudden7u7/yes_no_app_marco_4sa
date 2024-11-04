import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';

import 'package:yes_no_app_marco_4sa/main.dart';
import 'package:yes_no_app_marco_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_marco_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_marco_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_marco_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading es el espacio que hay antes del título
        //se envuenle en padding para que se haga pequeño
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.blogs.es/aee3d3/gawu1m5wsaafdop/1200_800.webp'),
          ),
        ), //avatar circular
        title: const Text('Goku'),
        centerTitle: true, //para forzar centrar el texto
      ),
      body: _ChatView(),
    );
  }
}

// El body se trabaja aquí
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // Mueve al 'Mundo' a una zona segura
      child: Padding(
        // Para que no estén pegados a los bordes
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Fondo del chat
            Expanded(
                // ListView dice cuantos elementos tengo y puede cambiar, por eso no es const
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              // Como va a construir cada elemento
              itemBuilder: (context, index) {
                //instancia del message que sabra de quien es el mensaje
                final message = chatProvider.messageList[index];
                // Indica cual es el elemento que está rendirizando en este momento
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble()
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),

            // Caja de texto
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
