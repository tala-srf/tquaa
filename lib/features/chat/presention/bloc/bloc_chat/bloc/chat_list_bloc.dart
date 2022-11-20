import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../data/model/chat_model.dart';
import '../../../../domin/usecases/chat_usecases.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatUsecase chatUsecase;
  ChatListBloc({required this.chatUsecase}) : super(ChatListInitial()) {
    on<ChatEvnet>((event, emit) async {
      emit(LoadingChatList());

      final succ = await chatUsecase();

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );
    });
  }
  ChatListState _eitherDoneMessageOrErrorState(
    Either<ErrorType, ChatModel> either,
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
        return AppErrorMessage.SERVER_FAILURE_MESSAGE;
      case OfflineError:
        return AppErrorMessage.OFFLINE_FAILURE_MESSAGE;
      default:
        return AppErrorMessage.errorExaption;
    }
  }
}
