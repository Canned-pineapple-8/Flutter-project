import '../../domain/repositories/content/model/content.dart';

abstract class FavoriteDataServiceInterface {
  Future<List<Content>> getFavorites();

  Future<void> addToFavorites(Content content);

  Future<void> removeFromFavorites(int productId);

  Future<bool> isFavorite(int productId);
}
