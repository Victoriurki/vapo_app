// import 'package:flutter/material.dart';
// import 'package:vapo_app/Home%20Page/home_page.dart';
// import 'package:vapo_app/Save%20Events/save_events.dart';
// import 'package:vapo_app/Search%20Page/search_page.dart';
// import '../AppColors/colors_app.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int selectedIndex = 0;
//   PageController pageController = PageController();

//   void onTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//     pageController.animateToPage(index,
//         duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: pageController,
//         children: const [
//           MyHomePage(),
//           SearchPage(),
//           SaveEvents(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: AppColors.appbarcolor,
//         type: BottomNavigationBarType.shifting,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
        
//         currentIndex: selectedIndex,
//         onTap: onTapped,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon:  Icon(Icons.home, color: AppColors.gradientcolorA,),
//               label: '',
//               backgroundColor: AppColors.appbarcolor),
//           BottomNavigationBarItem(
//               icon:  Icon(Icons.search, color: AppColors.gradientcolorA,),
//               label: '',
//               backgroundColor: AppColors.appbarcolor),
//           BottomNavigationBarItem(
//               icon:  Icon(Icons.bookmark,color: AppColors.gradientcolorA),
//               label: '',
//               backgroundColor: AppColors.appbarcolor),
//         ],
//       ),
//     );
//   }
// }

