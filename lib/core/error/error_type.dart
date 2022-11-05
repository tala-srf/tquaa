import 'package:equatable/equatable.dart';

abstract class ErrorType extends Equatable {}
class OfflineError extends ErrorType {
  @override
  List<Object?> get props => [];
}
class ServerFailure extends ErrorType {
  @override
  List<Object?> get props => [];
}