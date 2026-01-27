import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/content/model/content.dart';
import 'favorite_data_service_interface.dart';

class FavoriteDataService implements FavoriteDataServiceInterface {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _favoritesRef {
    final userId = _auth.currentUser?.uid;

    if (userId == null) {
      throw Exception('User is not authenticated');
    }

    return _firestore.collection('users').doc(userId).collection('favorites');
  }

  @override
  Future<List<Content>> getFavorites() async {
    try {
      final snapshot = await _favoritesRef.get();
      return snapshot.docs.map((doc) => Content.fromJson(doc.data())).toList();
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to load favorites';
    }
  }

  @override
  Future<void> addToFavorites(Content content) async {
    try {
      await _favoritesRef.doc(content.id.toString()).set({
        ...content.toJson(),
        'timestamp': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to add to favorites';
    }
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    try {
      await _favoritesRef.doc(productId.toString()).delete();
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to remove from favorites';
    }
  }

  @override
  Future<bool> isFavorite(int productId) async {
    try {
      final doc = await _favoritesRef.doc(productId.toString()).get();
      return doc.exists;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Failed to check favorite status';
    }
  }
}
