part of 'register1_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class Loading extends RegisterState {}

// ignore: must_be_immutable
class ErrorNet extends RegisterState {
  String? error;
  ErrorNet({this.error});
}

// ignore: must_be_immutable
class SuccessedRegister extends RegisterState {
  TrueRegister true1;
  SuccessedRegister({required this.true1});
}