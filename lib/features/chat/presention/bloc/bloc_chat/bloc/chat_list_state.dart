part of 'chat_list_bloc.dart';

abstract class ChatListState extends Equatable {
  const ChatListState();
  
  @override
  List<Object> get props => [];
}

class ChatListInitial extends ChatListState {}

class LoadingChatList extends ChatListState {}

class ErrorNetChatList extends ChatListState {
  String? error;
  ErrorNetChatList(this.error);
}

class SuccessedChatList extends ChatListState {
  ChatModel listchat;
  SuccessedChatList(this.listchat);
}