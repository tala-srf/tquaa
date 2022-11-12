import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/send_message_model.dart';

import '../../../../core/conf_api/conf.dart';
import '../../../../core/error/exception.dart';
import '../model/chat_model.dart';
import '../model/return_send_message.dart';

abstract class ChatDataSources {
  Future<ChatModel> chat(String token);
  Future<GetDialogByChatIdModel> getdialogbychat(String token, String id);
  Future<ReturnSendMessageModel> sendmessage(
      String token, SendMessageModel sendMessageModel);
  Future<String> image(int id);
}

class ChatDataSourcesImp implements ChatDataSources {
  @override
  Future<ChatModel> chat(String token) async {
    http.Response response = await http.get(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/Chat/GetAllChatList",
        ),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> chat = jsonDecode(response.body);
      ChatModel returnchat = ChatModel.fromJson(chat);

      return returnchat;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetDialogByChatIdModel> getdialogbychat(
      String token, String id) async {
    http.Response response = await http.get(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/Chat/GetDialogByChatId",
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Id': id
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> dialogchat = jsonDecode(response.body);
      GetDialogByChatIdModel returndialogchat =
          GetDialogByChatIdModel.fromJson(dialogchat);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final jsonStr = sharedPreferences.getString(
        "CACHED_message",
      );
if(jsonStr !=null){
        Map<String, dynamic> chatcash = jsonDecode(jsonStr);
      GetDialogByChatIdModel cashdialog =
          GetDialogByChatIdModel.fromJson(chatcash);
      if (returndialogchat.result!.dialogs!.length !=
              cashdialog.result!.dialogs!.length ||
          returndialogchat.result!.id != cashdialog.result!.id) {
        sharedPreferences.setString(
            "CACHED_message", json.encode(returndialogchat));
      }
}

      return returndialogchat;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ReturnSendMessageModel> sendmessage(
      String token, SendMessageModel sendMessageModel) async {
    http.Response response = await http.post(
        Uri.parse(
          "${ServiceConfig.base_url}/api/services/app/Chat/PostChat",
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(sendMessageModel));

    if (response.statusCode == 200) {
      Map<String, dynamic> sendmessage = jsonDecode(response.body);
      ReturnSendMessageModel returnsentmessage =
          ReturnSendMessageModel.fromJson(sendmessage);

      sendNotification(sendMessageModel.message , token );
      return returnsentmessage;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> image(int id) async {
    String url =
        "${ServiceConfig.base_url}/api/services/app/UserInformation/DownloadImage/$id";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return url;
    } else {
      throw ServerException();
    }
  }


  
   sendNotification(String? message ,String token ) async{
         await http.post(
   Uri.parse('https://mobiletest.tuqaatech.com/api/services/app/User/InsertFireBaseToken') ,
     headers: <String, String>{
    
       'Authorization': 'Bearer $token'
     },
     body: jsonEncode(
     <String, dynamic>{
       'notification': <String, dynamic>{
         'body': message,
         'title': 'message received'
       },
       'priority': 'high',
       'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
         'id': '1',
         'status': 'done'
       },
       'to': await FirebaseMessaging.instance.getToken(),
     },
    ),
  );

       } 
}
