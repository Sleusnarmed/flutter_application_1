import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('HOLA MUNDO', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),

        //
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcG83MXF2cDAyOXpxNWNsbWcybzhmcmpyMHU0anpqOXlidng0NnNpNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/fuJjrm6Cv2onpmpPEK/giphy.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Enviando imagen'),
          );
        },
      ),
    );
  }
}
