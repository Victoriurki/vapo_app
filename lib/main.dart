import 'package:flutter/material.dart';
import 'package:vapo_app/AppTheme/app_theme.dart';
import 'package:vapo_app/Login%20Feature/login_page.dart';
import 'app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(const AppWidget());
}

