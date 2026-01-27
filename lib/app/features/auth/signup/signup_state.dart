import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

// экран только открылся
class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

// идёт регистрация
class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

// регистрация успешная
class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}

// ошибка при регистрации
class SignUpError extends SignUpState {
  final String message;

  const SignUpError(this.message);

  @override
  List<Object?> get props => [message];
}
