abstract class LogoutState {}

// изначальное состояние
class LogoutInitial extends LogoutState {}

// выход в процессе
class LogoutLoading extends LogoutState {}

// успешный выход
class LogoutSuccess extends LogoutState {}

// ошибка
class LogoutError extends LogoutState {
  final String message;

  LogoutError(this.message);
}
