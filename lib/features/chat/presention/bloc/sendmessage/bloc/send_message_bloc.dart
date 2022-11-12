import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/return_send_message.dart';
import 'package:test_form_tuqaatech/features/chat/domin/entity/send_message.dart';

import '../../../../../../core/error/error_type.dart';
import '../../../../../../core/string/error_string.dart';
import '../../../../domin/usecases/send_message_usecases.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final SendMessageUsecase sendMessageUsecase;
  SendMessageBloc(this.sendMessageUsecase) : super(SendMessageInitial()) {
    on<MessageEvnet>((event, emit) async{
    emit(LoadingGetSendMessage());

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
        String token = sharedPreferences.getString('backend_token') ??
            'EMPTY_TOKEN' ;  
      final succ = await sendMessageUsecase( token,event.sendMessageEntity);

      emit(
        _eitherDoneMessageOrErrorState(
          succ,
        ),
      );

    });
  }
  SendMessageState _eitherDoneMessageOrErrorState(
    Either<ErrorType,ReturnSendMessageModel> either,
  ) {
    return either.fold(
        (failure) => ErrorNetSendMessage(
        _mapFailureToMessage(failure),
            ),
        (message) => SuccessedSendMessage(message));
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
