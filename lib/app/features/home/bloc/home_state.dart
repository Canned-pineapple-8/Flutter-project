part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Начальное состояние
final class HomeInitial extends HomeState {}

// Загрузка данных
final class HomeLoadInProgress extends HomeState {}

// Данные успешно получены
final class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({required this.content});

  final List<Content> content;

  @override
  List<Object> get props => [content];
}

// Ошибка при загрузке данных
final class HomeLoadFailure extends HomeState {
  const HomeLoadFailure({required this.exception});

  final Object? exception;

  @override
  List<Object> get props => [];
}
