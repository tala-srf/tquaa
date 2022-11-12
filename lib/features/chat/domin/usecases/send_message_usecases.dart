import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/return_send_message.dart';
import 'package:test_form_tuqaatech/features/chat/domin/entity/send_message.dart';

import '../../../../core/error/error_type.dart';
import '../repository/chat_repositry.dart';

class SendMessageUsecase {
  final ChatRepditry chatRepditry;

  SendMessageUsecase(this.chatRepditry);
  Future<Either<ErrorType, ReturnSendMessageModel>> call(String tonken,SendMessageEntity sendMessageEntity) async {
    return await chatRepditry.sendmessage(tonken, sendMessageEntity);
  }
}