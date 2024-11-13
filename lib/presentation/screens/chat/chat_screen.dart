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
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.blogs.es/aee3d3/gawu1m5wsaafdop/1200_800.webp'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Goku',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'En linea',
              style: TextStyle(fontSize: 12, color: Colors.green),
            )
          ],
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      // Instancia del message qy¿ue sabra de quien es el mensaje
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    })),

            // Caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
