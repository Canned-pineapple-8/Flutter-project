import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../../services/auth/auth_service_interface.dart';
import '../../../../di/di.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthServiceInterface authService;

  LoginBloc()
    : authService = getIt<AuthServiceInterface>(),
      super(const LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    try {
      await authService.logIn(email: event.email, password: event.password);

      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
