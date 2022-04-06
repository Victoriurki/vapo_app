import 'package:flutter/material.dart';

import '../Login Feature/logout_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(

      child: LogoutButton()
      
    );
  }
}