import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Login%20Feature/logout_button.dart';

class FirstBar extends StatelessWidget with PreferredSizeWidget {
  const FirstBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appbarcolor,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Vapo',
            style: AppFont.vapo2,
            textAlign: TextAlign.start,
          ),
        ],
      ),
      actions: const <Widget>[LogoutButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}