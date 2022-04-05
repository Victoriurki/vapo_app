import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vapo",
            style: AppFont.vapo,
          )
        ],
      ),
    );
  }
}
