import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_lab4/domain/repositories/games/model/game_model.dart';

class ContentScreen extends StatelessWidget {
  final String contentId;
  final GameModel? game;

  const ContentScreen({super.key, required this.contentId, this.game});

  @override
  Widget build(BuildContext context) {
    final selectedGame = game;

    if (selectedGame == null || selectedGame.id.toString() != contentId) {
      return Scaffold(
        appBar: AppBar(title: const Text('Подробности')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                const Text(
                  'Откройте игру из каталога.',
                  textAlign: TextAlign.center,
                ),
                FilledButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('К каталогу'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(selectedGame.title)),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    selectedGame.imageUrl,
                    height: 240,
                    fit: BoxFit.cover,
                    excludeFromSemantics: true,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 240,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        semanticLabel: 'Изображение недоступно',
                      ),
                    ),
                  ),
                ),
                Text(
                  selectedGame.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  selectedGame.description,
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
