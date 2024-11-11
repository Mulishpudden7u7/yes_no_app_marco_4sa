import 'package:flutter/material.dart';
import 'package:yes_no_app_marco_4sa/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // Alinear mis mensajes a la izquierda
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Fondo de los mensajes
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              // Hacer redondos los mensajes
              borderRadius: BorderRadius.circular(20)),
          // Separación (más bien ajuste de posición) de los mensajes
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

            // Texto de los mensajes
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Separación de mensajes
        const SizedBox(height: 5),

        _ImageBubble(
          imageURL: message.imageUrl!,
        ),

        const SizedBox(height: 10),
        // Todo: Imagen
      ],
    );
  }
}

// stles para widgets:
class _ImageBubble extends StatelessWidget {
  final String imageURL;

  const _ImageBubble({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        // Agregar borde a la imagen
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageURL,
          width: size.width * 0.5,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text(
                'contestando...',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ));
  }
}
