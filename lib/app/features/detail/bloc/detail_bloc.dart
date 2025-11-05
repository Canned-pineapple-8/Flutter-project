import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/domain.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ContentRepositoryInterface repository;

  DetailBloc(this.repository) : super(DetailInitial()) {
    on<DetailLoad>(_onDetailLoad);
  }

  Future<void> _onDetailLoad(
    DetailLoad event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailLoadInProgress());

    try {
      final content = await repository.getProductById(event.id);
      emit(DetailLoadSuccess(content));
    } catch (e) {
      emit(DetailLoadFailure(e.toString()));
    }
  }
}
