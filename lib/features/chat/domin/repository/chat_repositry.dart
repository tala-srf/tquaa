import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/chat_model.dart';

abstract class ChatRepditry {
  Future<Either<ErrorType, ChatModel>> getAlllistchat(String token);
}
