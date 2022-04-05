import 'package:flutter/material.dart';

import 'AppTheme/app_theme.dart';
import 'Login Feature/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: AppTheme.theme,
    );
  }
}