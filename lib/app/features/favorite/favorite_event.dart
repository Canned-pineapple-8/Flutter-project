part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class FavoriteLoad extends FavoriteEvent {}

class FavoriteAdd extends FavoriteEvent {
  final Content content;

  FavoriteAdd(this.content);
}

class FavoriteRemove extends FavoriteEvent {
  final int productId;

  FavoriteRemove(this.productId);
}

class FavoriteCheck extends FavoriteEvent {
  final int productId;

  FavoriteCheck(this.productId);
}
