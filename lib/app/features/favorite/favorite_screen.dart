import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';
import '../../widgets/content_card.dart';
import 'favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final FavoriteBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<FavoriteBloc>();
    _bloc.add(FavoriteLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Избранное')),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is FavoriteLoadInProgress) {
            // индикатор загрузки
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoriteFailure) {
            // ошибка
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          if (state is FavoriteLoadSuccess) {
            // сообщение о пустом списке избранного
            if (state.favorites.isEmpty) {
              return const Center(child: Text('Список избранного пуст'));
            }

            return ListView.builder(
              // отображаем список
              itemCount: state.favorites.length,
              itemBuilder: (_, index) {
                final item = state.favorites[index];
                return ContentCard(
                  id: item.id,
                  imagePath: item.image,
                  title: item.title,
                  description: item.description,
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
