part of 'favorite_bloc.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadInProgress extends FavoriteState {}

class FavoriteLoadSuccess extends FavoriteState {
  final List<Content> favorites;

  FavoriteLoadSuccess(this.favorites);
}

class FavoriteStatusSuccess extends FavoriteState {
  final bool isFavorite;

  FavoriteStatusSuccess(this.isFavorite);
}

class FavoriteFailure extends FavoriteState {
  final String message;

  FavoriteFailure(this.message);
}
