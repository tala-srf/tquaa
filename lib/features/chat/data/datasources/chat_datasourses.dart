import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/conf_api/conf.dart';
import '../model/chat_model.dart';

abstract class ChatDataSources {
  Future<ChatModel> chat(String token);
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
      throw UnimplementedError();
    }
  }
}
