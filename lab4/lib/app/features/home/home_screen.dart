import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_lab4/app/widgets/widgets.dart';
import 'package:flutter_lab4/di/di.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _home = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _home.add(const HomeLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SafeArea(child: GameSourceLink()),
      appBar: AppBar(title: const Text('Каталог игр')),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _home,
            builder: (context, state) => switch (state) {
              HomeInitial() => const SizedBox.shrink(),
              HomeLoadInProgress() => const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Загрузка игр',
                ),
              ),
              HomeLoadSuccess() => _buildSuccess(state),
              HomeLoadFailure() => _buildFailure(),
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(HomeLoadSuccess state) {
    final games = state.games;
    if (games.isEmpty) {
      return const Center(child: Text('Игры не найдены'));
    }

    return ListView.separated(
      key: const PageStorageKey('games-list'),
      padding: const EdgeInsets.all(16),
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return ContentCard(
          title: game.title,
          description: game.description,
          imageUrl: game.imageUrl,
          onTap: () => context.push('/content/${game.id}', extra: game),
        );
      },
      separatorBuilder: (_, _) => const SizedBox(height: 16),
    );
  }

  Widget _buildFailure() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          const Text('Не удалось загрузить игры'),
          const Text(
            'Проверьте подключение к интернету и повторите попытку.',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () => _home.add(const HomeLoad()),
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
