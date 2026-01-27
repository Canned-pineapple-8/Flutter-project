import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/content_card.dart';
import '../../../../di/di.dart';
import 'bloc/bloc.dart';

import '../auth/logout/logout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _home = getIt<HomeBloc>();

  void loadHome() => _home.add(const HomeLoad());

  @override
  void initState() {
    super.initState();
    loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          // возвращаемся на страницу авторизации при успешном выходе
          context.go('/login');
        }

        if (state is LogoutError) {
          // или показываем ошибку
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                context.go('/favorite');
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<LogoutBloc>().add(LogoutRequested());
              },
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: _home,
          builder: (context, state) {
            return switch (state) {
              HomeInitial() => const SizedBox.shrink(),
              HomeLoadInProgress() => const Center(
                child: CircularProgressIndicator(),
              ),
              HomeLoadSuccess() => _buildHomeLoadSuccess(state),
              HomeLoadFailure() => _buildHomeLoadFailure(state),
            };
          },
        ),
      ),
    );
  }

  Widget _buildHomeLoadSuccess(HomeLoadSuccess state) {
    final content = state.content;
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (_, index) => ContentCard(
        id: content[index].id,
        imagePath: content[index].image,
        title: content[index].title,
        description: content[index].description,
      ),
    );
  }

  Widget _buildHomeLoadFailure(HomeLoadFailure state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ошибка: ${state.exception}'),
          ElevatedButton(
            onPressed: loadHome,
            child: const Text('Попробовать снова'),
          ),
        ],
      ),
    );
  }
}
