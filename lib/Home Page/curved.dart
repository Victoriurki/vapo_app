import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/Home%20Page/home_page.dart';
import 'package:vapo_app/InfoPage/infopage.dart';
import 'package:vapo_app/Save%20Events/save_events.dart';
import 'package:vapo_app/Search%20Page/search_page.dart';

class Curved extends StatefulWidget {
  const Curved({Key? key}) : super(key: key);

  @override
  State<Curved> createState() => _CurvedState();
}

class _CurvedState extends State<Curved> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    const MyHomePage(),
    const SearchPage(),
    const SaveEvents(),
  ];

  @override
  Widget build(BuildContext context) {
    final itens = <Widget>[
      const Icon(
        Icons.home,
        size: 25,
      ),
      const Icon(
        Icons.search,
        size: 25,
      ),
      const Icon(Icons.favorite, size: 25),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: AppColors.appbarcolor,
          buttonBackgroundColor: AppColors.gradientcolorA,
          backgroundColor: Colors.transparent,
          height: 50,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          items: itens,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
