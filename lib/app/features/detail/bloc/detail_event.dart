part of 'detail_bloc.dart';

abstract class DetailEvent {}

class DetailLoad extends DetailEvent {
  final int id;

  DetailLoad(this.id);
}
