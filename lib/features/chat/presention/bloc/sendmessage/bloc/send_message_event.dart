part of 'send_message_bloc.dart';

abstract class SendMessageEvent extends Equatable {
  const SendMessageEvent();

  @override
  List<Object> get props => [];
}
// ignore: must_be_immutable
class MessageEvnet extends SendMessageEvent {
  SendMessageEntity sendMessageEntity;
  MessageEvnet(this.sendMessageEntity);
}