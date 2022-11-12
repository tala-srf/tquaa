part of 'get_dialog_by_chat_id_bloc.dart';

abstract class GetDialogByChatIdState extends Equatable {
  const GetDialogByChatIdState();
  
  @override
  List<Object> get props => [];
}

class GetDialogByChatIdInitial extends GetDialogByChatIdState {}




class LoadingGetChatByidList extends GetDialogByChatIdState {}

class ErrorNetChatByidList extends GetDialogByChatIdState {
  String? error;
  ErrorNetChatByidList(this.error);
}

class SuccessedChatByidList extends GetDialogByChatIdState {
  GetDialogByChatIdModel listchatdialog;
  SuccessedChatByidList(this.listchatdialog);
}
class Nochange extends GetDialogByChatIdState {
  GetDialogByChatIdModel listchatdialog;
  Nochange(this.listchatdialog);
}