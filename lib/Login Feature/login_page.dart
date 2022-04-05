import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Login%20Feature/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.gradientcolorA, AppColors.gradientcolorB])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "images/man-gesturing-no-light-skin-tone-icon-noto-emoji-people-86321.png"))),
                height: 189,
                width: 195,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Vapo",
                  style: AppFont.vapo,
                ),
              ),
              const LoginButton()
            ],
          ),
        ));
  }
}
