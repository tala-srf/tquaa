part of 'get_dialog_by_chat_id_bloc.dart';

abstract class GetDialogByChatIdEvent extends Equatable {
  const GetDialogByChatIdEvent();

  @override
  List<Object> get props => [];
}

class ChatByidEvnet extends GetDialogByChatIdEvent {
  String id;
  ChatByidEvnet(this.id);
}
