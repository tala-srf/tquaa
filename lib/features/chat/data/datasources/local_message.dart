import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_form_tuqaatech/features/chat/data/model/get_dialog_bychatid.dart';

abstract class MessageLocalDataSource {
  Future<GetDialogByChatIdModel> getCachedmessage();
  Future<Unit> cachemessage(GetDialogByChatIdModel message);
}

const CACHED_message = "CACHED_message";

class MessageLocalDataSourceImpl implements MessageLocalDataSource {
  final SharedPreferences sharedPreferences;

  MessageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachemessage(GetDialogByChatIdModel message) {
    GetDialogByChatIdModel messageModelsToJson = message;
    sharedPreferences.setString(
        CACHED_message, json.encode(messageModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<GetDialogByChatIdModel> getCachedmessage() {
    final jsonString = sharedPreferences.getString(CACHED_message);
    if (jsonString != null) {
       Map<String, dynamic> dialogchat = jsonDecode(jsonString);
      GetDialogByChatIdModel returndialogchat = GetDialogByChatIdModel.fromJson(dialogchat);
      return Future.value(returndialogchat);
    } else {
return  throw UnimplementedError();
    }
  }
}
