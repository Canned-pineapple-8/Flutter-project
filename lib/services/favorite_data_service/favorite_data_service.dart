import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/content/model/content.dart';
import 'favorite_data_service_interface.dart';

class FavoriteDataService implements FavoriteDataServiceInterface {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // получаем ссылку на коллекцию избранного конкретного пользователя (по uid)
  CollectionReference<Map<String, dynamic>> get _favoritesRef {
    final userId = _auth.currentUser?.uid;

    // проверка авторизации
    if (userId == null) {
      throw Exception('User is not authenticated');
    }

    // возвращаем путь к коллекции внутри документа пользователя
    return _firestore.collection('users').doc(userId).collection('favorites');
  }

  // получить список избранных элементов
  @override
  Future<List<Content>> getFavorites() async {
    try {
      // получаем все элементы в коллекции
      final snapshot = await _favoritesRef.get();
      // преобразуем каждый элемент в объект Content
      return snapshot.docs.map((doc) => Content.fromJson(doc.data())).toList();
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to load favorites';
    }
  }

  // добавить в избранное
  @override
  Future<void> addToFavorites(Content content) async {
    try {
      // обновляем документ с ID продукта
      await _favoritesRef.doc(content.id.toString()).set({
        // сохраняем поля
        ...content.toJson(),
        // и время добавления
        'timestamp': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to add to favorites';
    }
  }

  // удалить элемент из избранного
  @override
  Future<void> removeFromFavorites(int productId) async {
    try {
      // удаляем элемент по ID
      await _favoritesRef.doc(productId.toString()).delete();
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to remove from favorites';
    }
  }

  // проверить, находится ли элемент в избранном
  @override
  Future<bool> isFavorite(int productId) async {
    try {
      // пытаемся извлечь из избранного
      // существует -> есть в избранном
      final doc = await _favoritesRef.doc(productId.toString()).get();
      return doc.exists;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to check favorite status';
    }
  }
}
