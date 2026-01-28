import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/content/model/content.dart';
import '../../../../services/favorite_data_service/favorite_data_service_interface.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteDataServiceInterface favoriteService;

  // конструктор
  FavoriteBloc(this.favoriteService) : super(FavoriteInitial()) {
    on<FavoriteLoad>(_onLoad);
    on<FavoriteAdd>(_onAdd);
    on<FavoriteRemove>(_onRemove);
    on<FavoriteCheck>(_onCheck);
  }

  Future<void> _onLoad(FavoriteLoad event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoadInProgress());

    try {
      // получаем список избранного
      final favorites = await favoriteService.getFavorites();
      emit(FavoriteLoadSuccess(favorites));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> _onAdd(FavoriteAdd event, Emitter<FavoriteState> emit) async {
    try {
      // добавляем в избранное
      await favoriteService.addToFavorites(event.content);
      emit(FavoriteStatusSuccess(true));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> _onRemove(
    FavoriteRemove event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      // удаляем из избранного
      await favoriteService.removeFromFavorites(event.productId);
      emit(FavoriteStatusSuccess(false));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> _onCheck(
    FavoriteCheck event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      // проверяем, находится ли продукт в избранном
      final isFavorite = await favoriteService.isFavorite(event.productId);
      emit(FavoriteStatusSuccess(isFavorite));
    } catch (e) {
      emit(FavoriteFailure(e.toString()));
    }
  }
}
