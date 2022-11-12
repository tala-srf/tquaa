import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../data/model/chat_model.dart';
import '../../../../domin/usecases/chat_usecases.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
    final ChatUsecase chatUsecase;
  ChatListBloc(this.chatUsecase) : super(ChatListInitial()) {
    on<ChatEvnet>((event, emit)  async{
      emit(LoadingChatList());

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
        String token = sharedPreferences.getString('backend_token') ??
            'EMPTY_TOKEN' ;  
      final succ = await chatUsecase( token,);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
  }
ChatListState _eitherDoneMessageOrErrorState(
    Either<ErrorType,ChatModel> either,
  ) {
    return either.fold(
        (failure) => ErrorNetChatList(
              _mapFailureToMessage(failure),
            ),
        (chat) => SuccessedChatList(chat));
  }
     String _mapFailureToMessage(ErrorType failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineError:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
