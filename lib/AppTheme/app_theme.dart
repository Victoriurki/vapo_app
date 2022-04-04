import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
appBarTheme: AppBarTheme(
backgroundColor: AppColors.appbarcolor

 ),
 

          textTheme: TextTheme(
              headline1: AppFont.titleapp,
              headline2: AppFont.subtitleapp,
              headline3: AppFont.vapo),
          primaryColor: AppColors.backgroundcolors),
    );
  }
}
