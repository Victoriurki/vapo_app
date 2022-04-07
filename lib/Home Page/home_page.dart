import 'package:flutter/material.dart';
import 'package:vapo_app/Firebase/eventos.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';
import 'package:vapo_app/appbars/first_bar.dart';

import '../Login Feature/logout_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      const FirstBar(),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Eventos()));
      })),
     
    );
  }
}
