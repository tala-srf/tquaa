import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/shared/shared_pref.dart';
import 'injection.dart' as di;
import 'app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  SharedPreferences.getInstance().then(
    (prefs) {
      AppSharedPreferences.init(prefs);
      runApp(const MyApp());
    },
  );
}
