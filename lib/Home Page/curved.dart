import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Curved extends StatelessWidget {
   Curved({ Key? key }) : super(key: key);

final itens = <Widget>[
  const Icon(Icons.home, size: 30,),
  const Icon(Icons.search, size: 30,),
  const Icon(Icons.favorite, size: 30),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
       title: const Text('Navigation Bar'),
       elevation: 0,
       centerTitle: true, 
      ),
bottomNavigationBar: CurvedNavigationBar(
  height: 60,
  items: itens,
),
    );
  }
}