part of 'data_user_fire_bloc.dart';

abstract class DataUserFireState extends Equatable {
  const DataUserFireState();

  @override
  List<Object> get props => [];
}

class DataUserFireInitial extends DataUserFireState {}

// ignore: must_be_immutable
class Successedfire extends DataUserFireState {
  DataUserFireBaceModel user;
  Successedfire(this.user);
}

class ProcessingfireState extends DataUserFireState {}
// ignore: must_be_immutable
class ErrorNetfire extends DataUserFireState {
  String? error;
  ErrorNetfire(this.error);
}