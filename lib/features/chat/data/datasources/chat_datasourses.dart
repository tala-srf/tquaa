import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_form_tuqaatech/core/api/api_links.dart';
import 'package:test_form_tuqaatech/core/api/api_methods.dart';
import 'package:test_form_tuqaatech/core/shared/shared_pref.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/send_message_model.dart';
import '../../../../core/error/exception.dart';
import '../model/chat_model.dart';
import '../model/return_send_message.dart';

abstract class ChatDataSources {
  Future<ChatModel> chat();
  Future<GetDialogByChatIdModel> getdialogbychat(String id);
  Future<ReturnSendMessageModel> sendmessage(SendMessageModel sendMessageModel);
  Future<String> image(int id);
}

class ChatDataSourcesImp implements ChatDataSources {
  @override
  Future<ChatModel> chat() async {
    var response = await ApiMethods()
        .get(url: ApiGet.listchatuser, path: {}, query: {}, headeradd: {});

    if (response.statusCode == 200) {
      Map<String, dynamic> chat = jsonDecode(response.body);
      ChatModel returnchat = ChatModel.fromJson(chat);

      return returnchat;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetDialogByChatIdModel> getdialogbychat(String id) async {
    var response = await ApiMethods().get(
        url: ApiGet.allmessagesuser,
        path: {},
        query: {},
        headeradd: {"Id": id});

    if (response.statusCode == 200) {
      Map<String, dynamic> dialogchat = jsonDecode(response.body);
      GetDialogByChatIdModel returndialogchat =
          GetDialogByChatIdModel.fromJson(dialogchat);

      final jsonStr = AppSharedPreferences.getCashMessagesFromAUser();
      if (jsonStr != "") {
        Map<String, dynamic> chatcash = jsonDecode(jsonStr);
        GetDialogByChatIdModel cashdialog =
            GetDialogByChatIdModel.fromJson(chatcash);
        if (returndialogchat.result!.dialogs!.length !=
                cashdialog.result!.dialogs!.length ||
            returndialogchat.result!.id != cashdialog.result!.id) {
          AppSharedPreferences.cashMessagesFromAUser(
              getDialogByChatIdModel: returndialogchat);
        }
      }

      return returndialogchat;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ReturnSendMessageModel> sendmessage(
      SendMessageModel sendMessageModel) async {
    var response = await ApiMethods()
        .post(url: ApiPost.sendmessage, body: sendMessageModel, query: {});

    if (response.statusCode == 200) {
      Map<String, dynamic> sendmessage = jsonDecode(response.body);
      ReturnSendMessageModel returnsentmessage =
          ReturnSendMessageModel.fromJson(sendmessage);

      return returnsentmessage;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> image(int id) async {
    String url = "${ApiBaseUrl.baseUrl}${ApiGet.imageuser}/$id";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return url;
    } else {
      throw ServerException();
    }
  }
}
