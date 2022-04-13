import 'package:flutter/material.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Home%20Page/curved.dart';
import 'package:vapo_app/Home%20Page/home_page.dart';
import 'package:vapo_app/Home%20Page/mainpage.dart';
import 'package:vapo_app/Login%20Feature/gg_signin_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        minimumSize: const Size(double.infinity, 50),
      ),
      icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
      label: Text(
        'Sign Up with Google',
        style: AppFont.titleapp,
      ),
      onPressed: () async {
        final result = await GoogleSignInController().googleLogin();

        if (result == false) {
          showDialog(
              context: context,
              builder: (context) {
                return const Dialog(
                  child: Text('Por favor clicar no local indicado'),
                );
              });
        }
        if (result == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Curved(),
            ),
          );
        }
      },
    );
  }
}
