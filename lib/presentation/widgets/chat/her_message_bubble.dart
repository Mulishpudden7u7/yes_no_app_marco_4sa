import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            // Texto de los mensajes
            child: Text(
              'Hola Marquito',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),

        // Separación de mensajes
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),
        // Todo: Imagen
      ],
    );
  }
}

// stles para widgets:
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(

        // Agregar borde a la imagen
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://steamuserimages-a.akamaihd.net/ugc/2436887023502667827/BE82A9A8E7E6623E122356D5DD0EE6A51105FD5A/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
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
                'Tay <3 está mandando un mensaje',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ));
  }
}
