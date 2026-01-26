import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import '../../../../services/auth/auth_service_interface.dart';
import '../../../../di/di.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthServiceInterface authService;

  SignUpBloc()
    : authService = getIt<AuthServiceInterface>(),
      super(const SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(const SignUpLoading());

    try {
      await authService.signUp(email: event.email, password: event.password);

      emit(const SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
