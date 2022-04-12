import 'package:flutter/material.dart';
import 'package:vapo_app/appbars/first_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FirstBar(),
      
    );
  }
}