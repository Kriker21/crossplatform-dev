import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class GameSourceLink extends StatelessWidget {
  const GameSourceLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.https('www.freetogame.com', '/'),
      target: LinkTarget.blank,
      builder: (context, followLink) => TextButton(
        onPressed: followLink,
        child: const Text('Источник данных: FreeToGame.com'),
      ),
    );
  }
}
