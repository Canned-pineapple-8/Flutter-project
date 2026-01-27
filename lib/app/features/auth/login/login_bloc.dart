import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../../services/auth/auth_service_interface.dart';
import '../../../../di/di.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthServiceInterface authService;

  // получаем сервис из di
  LoginBloc()
    : authService = getIt<AuthServiceInterface>(),
      super(const LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  // обработка запроса на авторизацию
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    try {
      // выполняем метод сервиса
      await authService.logIn(email: event.email, password: event.password);

      emit(const LoginSuccess()); // авторизация успешная
    } catch (e) {
      // ..или произошла ошибка
      emit(LoginError(e.toString()));
    }
  }
}
