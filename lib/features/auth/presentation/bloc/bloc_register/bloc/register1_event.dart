part of 'register1_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
class EventRegister extends RegisterEvent {
  RegisterEntity event1;
  EventRegister({required this.event1});
}