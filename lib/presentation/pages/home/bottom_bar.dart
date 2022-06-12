import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/bookmark_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/chatbot.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/profil_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/home_page.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/create_destination.dart';
import 'package:flutter/material.dart';

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
    const BookmarkPage(),
    const ChatBotScreen(),
    const ProfilPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => createDestination(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomePage();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentIndex == 0 ? primaryColor : greyColor,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color:
                                  currentIndex == 0 ? primaryColor : greyColor),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const BookmarkPage();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark,
                          color: currentIndex == 1 ? primaryColor : greyColor,
                        ),
                        Text(
                          'Bookmark',
                          style: TextStyle(
                              color:
                                  currentIndex == 1 ? primaryColor : greyColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const ChatBotScreen();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentIndex == 3 ? primaryColor : greyColor,
                        ),
                        Text(
                          'Chatbot',
                          style: TextStyle(
                              color:
                                  currentIndex == 3 ? primaryColor : greyColor),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfilPage();
                        currentIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentIndex == 4 ? primaryColor : greyColor,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color:
                                  currentIndex == 4 ? primaryColor : greyColor),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
