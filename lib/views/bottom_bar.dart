import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'detail_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    // DetailPage(),
    const AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: whiteColor,
            unselectedItemColor: whiteColor70,
            iconSize: 40,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: primaryColor,
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.details),
              //   label: 'Detail',
              //   backgroundColor: primaryColor,
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: primaryColor,
              ),
            ]));
  }
}
