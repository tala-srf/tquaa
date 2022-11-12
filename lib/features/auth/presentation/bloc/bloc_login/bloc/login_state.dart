part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingLogin extends LoginState {}

class ErrorNetLogin extends LoginState {
  String? error;
  ErrorNetLogin(this.error);
}

class SuccessedLogin extends LoginState {
  TokenEntity user;
  SuccessedLogin(this.user);
}
class ProcessingLogOutState extends LoginState {}



class LogOutState extends LoginState {}