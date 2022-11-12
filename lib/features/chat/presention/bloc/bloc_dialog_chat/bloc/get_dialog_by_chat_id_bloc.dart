import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../domin/usecases/get_dialog_bychatId.dart';

part 'get_dialog_by_chat_id_event.dart';
part 'get_dialog_by_chat_id_state.dart';

class GetDialogByChatIdBloc
    extends Bloc<GetDialogByChatIdEvent, GetDialogByChatIdState> {
  final GetDialogByChatIdUsecase chatUsecase;
  GetDialogByChatIdBloc(this.chatUsecase) : super(GetDialogByChatIdInitial()) {
    on<ChatByidEvnet>((event, emit) async {
      emit(LoadingGetChatByidList());

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token =
          sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
      final succ = await chatUsecase(token, event.id);

      emit(
        _eitherDoneMessageOrErrorState(succ, ),
      );
    });
  }
  GetDialogByChatIdState _eitherDoneMessageOrErrorState(
      Either<ErrorType, GetDialogByChatIdModel> either,
      ) {
    return either.fold(
        (failure) => ErrorNetChatByidList(
             _mapFailureToMessage(failure),
            ), (chat) {
    
      return SuccessedChatByidList(chat);
    });
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
