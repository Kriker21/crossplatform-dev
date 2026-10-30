import 'package:flutter/material.dart';
import 'package:flutter_lab3/app/data/games.dart';
import 'package:flutter_lab3/app/extensions/extensions.dart';
import 'package:flutter_lab3/app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Каталог игр')),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Все игры',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return ContentCard(
                      title: game.title,
                      description: game.description,
                      imagePath: game.imagePath,
                      onTap: () => context.push('/content/${game.id}'),
                    );
                  },
                  separatorBuilder: (_, _) => 16.ph,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
