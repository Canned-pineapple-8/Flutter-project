part of 'detail_bloc.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadInProgress extends DetailState {}

class DetailLoadSuccess extends DetailState {
  final Content content;

  DetailLoadSuccess(this.content);
}

class DetailLoadFailure extends DetailState {
  final String error;

  DetailLoadFailure(this.error);
}
