import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/chat/data/model/get_dialog_bychatid.dart';
import '../string/keys_manger.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }

  // Register Token & UserId & Username
  static void cacheAuthUserInfo({
    required String accToken,
    required int userId,
  }) {
    _sharedPreferences.setString(AppKeysManger.ACC_TOKEN, accToken);
    _sharedPreferences.setInt(AppKeysManger.USER_ID, userId);
  }

  // register cash Messages from a user
  static  cashMessagesFromAUser(
      {required GetDialogByChatIdModel getDialogByChatIdModel}) {
    return _sharedPreferences.setString(
        AppKeysManger.cash_messages, json.encode(getDialogByChatIdModel));
  }

  // Get Token If It Registered Or Return Empty Value ''
  static String getAccToken() {
    return _sharedPreferences.getString(AppKeysManger.ACC_TOKEN) ?? '';
  }

// Get cash messages from a user
  static String getCashMessagesFromAUser() {
    return _sharedPreferences.getString(AppKeysManger.cash_messages) ?? "";
  }

  // Make Logout And Clear All The Keys And All Values Stored
  static void logoutSharedPreferences() {
    _sharedPreferences.clear();
  }
}
