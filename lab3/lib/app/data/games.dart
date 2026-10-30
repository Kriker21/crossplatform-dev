import 'package:flutter_lab3/app/models/game.dart';

const List<Game> games = [
  Game(
    id: 'minecraft',
    title: 'Minecraft',
    description: 'Песочница: строительство и исследование мира.',
    fullDescription:
        'В Minecraft игрок исследует мир, добывает ресурсы '
        'и строит различные сооружения.\n\n'
        'В режиме выживания нужно собирать материалы '
        'и защищаться от противников. Творческий режим '
        'позволяет строить с неограниченным запасом ресурсов.',
    imagePath: 'assets/images/minecraft.jpg',
  ),
  Game(
    id: 'terraria',
    title: 'Terraria',
    description: 'Приключения, строительство и сражения в 2D.',
    fullDescription:
        'Terraria — приключенческая игра с исследованием '
        'двумерного мира, добычей ресурсов и строительством.\n\n'
        'Игрок создаёт инструменты и оружие, исследует '
        'подземелья, сражается с противниками и боссами.',
    imagePath: 'assets/images/terraria.jpg',
  ),
  Game(
    id: 'stardew-valley',
    title: 'Stardew Valley',
    description: 'Фермерская жизнь и знакомство с жителями долины.',
    fullDescription:
        'В Stardew Valley игрок восстанавливает старую ферму: '
        'выращивает растения, разводит животных '
        'и обустраивает участок.\n\n'
        'Кроме работы на ферме можно заниматься рыбалкой, '
        'исследовать шахты и знакомиться с жителями долины.',
    imagePath: 'assets/images/stardew_valley.jpg',
  ),
  Game(
    id: 'portal-2',
    title: 'Portal 2',
    description: 'Головоломки с порталами и необычная история.',
    fullDescription:
        'Portal 2 — головоломка от первого лица. '
        'Игрок использует устройство для создания порталов, '
        'чтобы перемещаться между участками испытательных камер.\n\n'
        'Для прохождения нужно взаимодействовать с кнопками, '
        'кубами и другими механизмами.',
    imagePath: 'assets/images/portal_2.jpg',
  ),
  Game(
    id: 'hollow-knight',
    title: 'Hollow Knight',
    description: 'Исследование подземного королевства и сражения.',
    fullDescription:
        'В Hollow Knight игрок исследует подземное '
        'королевство, открывает новые области '
        'и встречает его обитателей.\n\n'
        'Новые способности помогают преодолевать препятствия '
        'и возвращаться в ранее недоступные места.',
    imagePath: 'assets/images/hollow_knight.jpg',
  ),
];