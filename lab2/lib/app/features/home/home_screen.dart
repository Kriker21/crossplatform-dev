import 'package:flutter/material.dart';

import 'package:flutter_lab2/app/extensions/extensions.dart';
import 'package:flutter_lab2/app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final games = [
  (
    title: 'Minecraft',
    description: 'Песочница: строительство и исследование мира.',
    imagePath: 'assets/images/minecraft.jpg',
  ),
  (
    title: 'Terraria',
    description: 'Приключения, строительство и сражения в 2D.',
    imagePath: 'assets/images/terraria.jpg',
  ),
  (
    title: 'Stardew Valley',
    description: 'Фермерская жизнь и знакомство с жителями долины.',
    imagePath: 'assets/images/stardew_valley.jpg',
  ),
  (
    title: 'Portal 2',
    description: 'Головоломки с порталами и необычная история.',
    imagePath: 'assets/images/portal_2.jpg',
  ),
  (
    title: 'Hollow Knight',
    description: 'Исследование подземного королевства и сражения.',
    imagePath: 'assets/images/hollow_knight.jpg',
  ),
];
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
