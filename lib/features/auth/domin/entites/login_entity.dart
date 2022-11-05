import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? userNameOrEmailAddress;
  final String? password;
  final bool? rememberClient;

   LoginEntity(
      this.password, this.rememberClient, this.userNameOrEmailAddress);
  @override
  List<Object?> get props => [password,userNameOrEmailAddress,rememberClient];
}
