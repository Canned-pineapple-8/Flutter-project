import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../di/di.dart';
import '../features/features.dart';
import '../features/home/home.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (_, state) =>
          MaterialPage(key: state.pageKey, child: const HomeScreen()),
    ),
    GoRoute(
      path: '/detail',
      pageBuilder: (context, state) {
        final args = state.extra as Map<String, String>;
        return MaterialPage(
          key: state.pageKey,
          child: DetailScreen(
            imagePath: args['image']!,
            title: args['title']!,
            description: args['description']!,
          ),
        );
      },
    ),
  ],
);
