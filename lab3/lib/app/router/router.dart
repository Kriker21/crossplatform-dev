import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:flutter_lab3/di/di.dart';
import 'package:flutter_lab3/app/features/features.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/content/:id',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: ContentScreen(contentId: state.pathParameters['id']!),
      ),
    ),
  ],
);
