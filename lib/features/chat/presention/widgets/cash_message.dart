import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/get_dialog_bychatid.dart';

GetDialogByChatIdModel? cashdialog;
void cashmessage() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final jsonStr = sharedPreferences.getString(
    "CACHED_message",
  );
  if (jsonStr != null) {
    Map<String, dynamic> chatcash = jsonDecode(jsonStr);
    cashdialog = GetDialogByChatIdModel.fromJson(chatcash);
  } else {
    cashdialog = GetDialogByChatIdModel(
        result:
            Result(dialogs: [Dialogs(message: "", who: 1, chatid: "", id: 1)]));
    sharedPreferences.setString("CACHED_message",json.encode(cashdialog));
  }
}
