import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';

import '../../data/model/chat_model.dart';
import '../repository/chat_repositry.dart';

class ChatUsecase {
  final ChatRepditry chatRepditry;

  ChatUsecase({required this.chatRepditry});
  Future<Either<ErrorType, ChatModel>> call() async {
    return await chatRepditry.getAlllistchat();
  }
}
