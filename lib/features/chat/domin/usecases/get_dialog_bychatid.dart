import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';

import '../../../../core/error/error_type.dart';
import '../repository/chat_repositry.dart';

class GetDialogByChatIdUsecase {
  final ChatRepditry chatRepditry;

  GetDialogByChatIdUsecase(this.chatRepditry);
  Future<Either<ErrorType, GetDialogByChatIdModel>> call(String tonken,String id) async {
    return await chatRepditry.getdialogbychat(tonken,id);
  }
}
