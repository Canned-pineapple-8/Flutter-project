part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

// загрузка списка избранного
class FavoriteLoad extends FavoriteEvent {}

// добавление в избранное
class FavoriteAdd extends FavoriteEvent {
  final Content content;

  FavoriteAdd(this.content);
}

// удаление из избранного
class FavoriteRemove extends FavoriteEvent {
  final int productId;

  FavoriteRemove(this.productId);
}

// проверка на наличие в избранном
class FavoriteCheck extends FavoriteEvent {
  final int productId;

  FavoriteCheck(this.productId);
}
