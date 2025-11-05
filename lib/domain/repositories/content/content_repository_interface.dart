import 'model/content.dart';

abstract class ContentRepositoryInterface {
  Future<List<Content>> getContent();
  Future<Content> getProductById(int id);
}
