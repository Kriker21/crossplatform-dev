import 'package:flutter/material.dart';
import 'package:flutter_lab3/app/data/games.dart';

class ContentScreen extends StatelessWidget {
  final String contentId;

  const ContentScreen({
    super.key,
    required this.contentId,
  });

  @override
  Widget build(BuildContext context) {
    final index = games.indexWhere(
      (game) => game.id == contentId,
    );

    if (index == -1) {
      return Scaffold(
        appBar: AppBar(title: const Text('Подробности')),
        body: const Center(child: Text('Игра не найдена')),
      );
    }

    final game = games[index];

    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    game.imagePath,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  game.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  game.fullDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}