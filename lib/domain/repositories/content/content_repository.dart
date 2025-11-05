import 'package:dio/dio.dart';
import 'model/content.dart';
import '../../../data/endpoints.dart';
import 'content_repository_interface.dart';

class ContentRepository implements ContentRepositoryInterface {
  final Dio dio;

  ContentRepository({required this.dio});

  @override
  Future<List<Content>> getContent() async {
    try {
      final response = await dio.get(Endpoints.content);
      final List data = response.data['products'];
      return data.map((e) => Content.fromJson(e)).toList();
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<Content> getProductById(int id) async {
    try {
      final response = await dio.get(Endpoints.productById(id));
      return Content.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
