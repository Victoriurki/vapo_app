import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Login%20Feature/gg_signin_controller.dart';
import 'login_page.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(textStyle: AppFont.vapo2, primary: Colors.white
        ),
        onPressed: (() {
          GoogleSignInController().logout();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const LoginPage())));
        }),
        child: const  Text("Logout", style: TextStyle(color: Colors.white) ,));
  }
}
