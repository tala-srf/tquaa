part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Loginevent extends LoginEvent {
  LoginEntity entity;
  Loginevent({required this.entity});
}

class SignOutEvent extends LoginEvent {}