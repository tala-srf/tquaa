import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/chat_model.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';

import '../../data/model/return_send_message.dart';
import '../entity/send_message.dart';

abstract class ChatRepditry {
  Future<Either<ErrorType, ChatModel>> getAlllistchat();
  Future<Either<ErrorType, GetDialogByChatIdModel>> getdialogbychat(
       String id);
  Future<Either<ErrorType, ReturnSendMessageModel>> sendmessage(
     SendMessageEntity sendMessageEntity);
        Future<Either<ErrorType, String>> image(
      int id);
}
