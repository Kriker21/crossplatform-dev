import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab5/di/di.dart';

import 'bloc/content_bloc.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key, required this.contentId});

  final String contentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ContentBloc>()..add(ContentLoad(contentId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Подробности')),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: BlocBuilder<ContentBloc, ContentState>(
              builder: (context, state) => switch (state) {
                ContentInitial() => const SizedBox.shrink(),
                ContentLoadInProgress() => const Center(
                  child: CircularProgressIndicator(),
                ),
                ContentLoadSuccess() => _buildSuccess(context, state),
                ContentLoadFailure() => _buildFailure(context),
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, ContentLoadSuccess state) {
    final game = state.game;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Image.network(
            game.imageUrl,
            height: 240,
            fit: BoxFit.cover,
            excludeFromSemantics: true,
            webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 240,
              child: Icon(Icons.broken_image_outlined),
            ),
          ),
          Text(game.title, style: Theme.of(context).textTheme.headlineMedium),
          Text(game.fullDescription ?? game.description),
        ],
      ),
    );
  }

  Widget _buildFailure(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          const Text('Не удалось загрузить игру'),
          ElevatedButton(
            onPressed: () =>
                context.read<ContentBloc>().add(ContentLoad(contentId)),
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
