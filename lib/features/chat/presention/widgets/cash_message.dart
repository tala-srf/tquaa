import 'dart:convert';

import 'package:test_form_tuqaatech/core/shared/shared_pref.dart';

import '../../data/model/get_dialog_bychatid.dart';

GetDialogByChatIdModel? cashdialog;
void cashmessage() async {
  final jsonStr = AppSharedPreferences.getCashMessagesFromAUser();
  if (jsonStr != "") {
    Map<String, dynamic> chatcash = jsonDecode(jsonStr);
    cashdialog = GetDialogByChatIdModel.fromJson(chatcash);
  } else {
    cashdialog = GetDialogByChatIdModel(
        result:
            Result(dialogs: [Dialogs(message: "", who: 1, chatid: "", id: 1)]));
    AppSharedPreferences.cashMessagesFromAUser(
        getDialogByChatIdModel: cashdialog!);
  }
}
