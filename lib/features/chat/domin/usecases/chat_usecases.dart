import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/core/error/error_type.dart';


import '../../data/model/chat_model.dart';
import '../repository/chat_repositry.dart';

class ChatUsecase {
  final ChatRepditry chatRepditry;

  ChatUsecase(this.chatRepditry);
  Future<Either<ErrorType, ChatModel>> call(String tonken) async {
    return await chatRepditry.getAlllistchat(tonken);
  }
}
