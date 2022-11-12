part of 'send_message_bloc.dart';

abstract class SendMessageState extends Equatable {
  const SendMessageState();
  
  @override
  List<Object> get props => [];
}

class SendMessageInitial extends SendMessageState {}
class LoadingGetSendMessage extends SendMessageState {}

class ErrorNetSendMessage extends SendMessageState {
  String? error;
  ErrorNetSendMessage(this.error);
}

class SuccessedSendMessage extends SendMessageState {
  ReturnSendMessageModel sendmessage ;
  SuccessedSendMessage(this.sendmessage );
}