import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../di/di.dart';
import '../features/features.dart';
import '../features/home/home.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/auth/signup/signup.dart';
import '../features/auth/login/login.dart';
import '../features/auth/logout/logout.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true,
  initialLocation: '/login',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<HomeBloc>()..add(const HomeLoad()),
              ),
              BlocProvider(create: (_) => getIt<LogoutBloc>()),
            ],
            child: const HomeScreen(),
          ),
        );
      },
    ),

    GoRoute(
      path: '/detail',
      pageBuilder: (context, state) {
        final id = state.extra as int;

        return MaterialPage(
          key: state.pageKey,
          child: DetailScreen(id: id),
        );
      },
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => SignUpBloc(), // логика
            child: const SignUpScreen(), // экран регистрации
          ),
        );
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => LoginBloc(), // логика
            child: const LoginScreen(), // экран авторизации
          ),
        );
      },
    ),
  ],
);
