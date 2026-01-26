import 'package:flutter_bloc/flutter_bloc.dart';

import 'logout_event.dart';
import 'logout_state.dart';
import '../../../../services/auth/auth.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthServiceInterface _authService;

  LogoutBloc(this._authService) : super(LogoutInitial()) {
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    try {
      await _authService.logOut();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
