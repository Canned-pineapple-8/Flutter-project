import '../../domain/repositories/content/model/content.dart';

abstract class FavoriteDataServiceInterface {
  // получить список избранного
  Future<List<Content>> getFavorites();

  // добавить в избранное
  Future<void> addToFavorites(Content content);

  // удалить из избранного
  Future<void> removeFromFavorites(int productId);

  // является избранным?
  Future<bool> isFavorite(int productId);
}
