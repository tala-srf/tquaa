import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_form_tuqaatech/core/error/error_type.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/network/internet_checker.dart';
import '../../domin/repository/chat_repositry.dart';
import '../datasources/chat_datasourses.dart';
import '../model/chat_model.dart';


class ChatRepositoryImp implements ChatRepditry {
  final InternetChecker internet;
  final ChatDataSources chatDatasources;

  ChatRepositoryImp(this.internet, this.chatDatasources);

 @override
  Future<Either<ErrorType,ChatModel>> getAlllistchat(String token) async{
  
 if (await internet.isConnected) {
      try {
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
       String token1= sharedPreferences.getString('backend_token') ??
              'EMPTY_TOKEN';
     final chat=   await chatDatasources.chat(token1);
        return Right(chat);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineError());
    }
  }
  

}
