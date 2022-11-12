import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as di;
import 'app/myapp.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
