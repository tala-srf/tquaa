import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../domin/usecases/get_dialog_bychatId.dart';

part 'get_dialog_by_chat_id_event.dart';
part 'get_dialog_by_chat_id_state.dart';

class GetDialogByChatIdBloc
    extends Bloc<GetDialogByChatIdEvent, GetDialogByChatIdState> {
  final GetDialogByChatIdUsecase chatUsecase;
  GetDialogByChatIdBloc({required this.chatUsecase})
      : super(GetDialogByChatIdInitial()) {
    on<ChatByidEvnet>((event, emit) async {
      emit(LoadingGetChatByidList());

      final succ = await chatUsecase(event.id);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
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
        return AppErrorMessage.SERVER_FAILURE_MESSAGE;
      case OfflineError:
        return AppErrorMessage.OFFLINE_FAILURE_MESSAGE;
      default:
        return AppErrorMessage.errorExaption;
    }
  }
}
