part of 'favorite_bloc.dart';

abstract class FavoriteState {}

// изначальное состояние
class FavoriteInitial extends FavoriteState {}

// загрузка в процессе
class FavoriteLoadInProgress extends FavoriteState {}

// успешная загрузка (список избранного)
class FavoriteLoadSuccess extends FavoriteState {
  final List<Content> favorites;

  FavoriteLoadSuccess(this.favorites);
}

// успешное добавление в избранное
class FavoriteStatusSuccess extends FavoriteState {
  final bool isFavorite;

  FavoriteStatusSuccess(this.isFavorite);
}

// неудача
class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure(this.message);
}
