import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import '../../../../services/auth/auth_service_interface.dart';
import '../../../../di/di.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthServiceInterface authService;

  // получение сервиса из di
  SignUpBloc()
    : authService = getIt<AuthServiceInterface>(),
      super(const SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  // обработчик запроса на регистрацию
  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    // индикатор загрузки
    emit(const SignUpLoading());

    try {
      // вызов регистрации у firebaseAuth (через интерфейс)
      await authService.signUp(email: event.email, password: event.password);

      // регистрация успешна
      emit(const SignUpSuccess());
    } catch (e) {
      // ... или возникла ошибка
      emit(SignUpError(e.toString()));
    }
  }
}
