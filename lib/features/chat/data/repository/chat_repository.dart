
import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:dartz/dartz.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/send_message_model.dart';
import 'package:test_form_tuqaatech/features/chat/domin/entity/send_message.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/return_send_message.dart';
import '../../../../core/network/internet_checker.dart';
import '../../domin/repository/chat_repositry.dart';
import '../datasources/chat_datasourses.dart';
import '../model/chat_model.dart';

class ChatRepositoryImp implements ChatRepditry {
  final InternetChecker internet;
  final ChatDataSources chatDatasources;
  // final MessageLocalDataSource messageLocalDataSource;

  ChatRepositoryImp(
     {required this.internet,required this.chatDatasources});

  @override
  Future<Either<ErrorType, ChatModel>> getAlllistchat() async {
    if (await internet.isConnected) {
      try {
        final chat = await chatDatasources.chat();
        return Right(chat);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }

  @override
  Future<Either<ErrorType, GetDialogByChatIdModel>> getdialogbychat(
     String id) async {
    if (await internet.isConnected) {
      try {
        
        final dialogchat = await chatDatasources.getdialogbychat( id);
        return Right(dialogchat);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }

  @override
  Future<Either<ErrorType, ReturnSendMessageModel>> sendmessage(
       SendMessageEntity sendMessageEntity) async {
    final SendMessageModel sendMessage = SendMessageModel(
        message: sendMessageEntity.message,
        recipientID: sendMessageEntity.recipientID,
        time: sendMessageEntity.time,
        who: sendMessageEntity.who);

    if (await internet.isConnected) {
      try {

        final sendMess = await chatDatasources.sendmessage( sendMessage);
        return Right(sendMess);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
  
  @override
  Future<Either<ErrorType, String>> image(int id)async {
if (await internet.isConnected) {
      try {
        
        final image = await chatDatasources.image( id);
        return Right(image);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
}
