import 'package:flutter_bloc/flutter_bloc.dart';

import 'logout_event.dart';
import 'logout_state.dart';
import '../../../../services/auth/auth.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  // интерфейс сервиса
  final AuthServiceInterface _authService;

  LogoutBloc(this._authService) : super(LogoutInitial()) {
    on<LogoutRequested>(_onLogoutRequested);
  }

  // при запросе на выход
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    try {
      // вызываем метод сервиса
      await _authService.logOut();
      // выход успешен
      emit(LogoutSuccess());
    } catch (e) {
      // ..или произошла ошибка
      emit(LogoutError(e.toString()));
    }
  }
}
