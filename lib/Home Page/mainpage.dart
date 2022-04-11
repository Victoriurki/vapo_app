import 'package:flutter/material.dart';
import 'package:vapo_app/Home%20Page/home_page.dart';
import 'package:vapo_app/Save%20Events/save_events.dart';
import 'package:vapo_app/Search%20Page/search_page.dart';

import '../AppColors/colors_app.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  
void onTapped(int index){
setState(() {
  selectedIndex = index;  
});
pageController.jumpToPage(index);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          MyHomePage(),
          SearchPage(),
          SaveEvents(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap:onTapped,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon:  Icon(Icons.search),
              label: '',
              backgroundColor: Colors.red),
           BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '',
              backgroundColor: Colors.blue)
        ],
      ),
    );
  }
}
