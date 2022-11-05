import 'package:equatable/equatable.dart';

class TrueRegister extends Equatable {
  final bool? canLogin;

  const TrueRegister(this.canLogin);
  @override
  List<Object?> get props => [canLogin];
}
