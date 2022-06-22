import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/category/category_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/about_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/delete_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/request_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/update_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/detail_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KWI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: const SplashScreen(),
      routes: {
        DetailPage.routeName: (context) => DetailPage(
              destinationDetail: ModalRoute.of(context)?.settings.arguments
                  as DestinationDetail,
            ),
        AboutPage.routeName: (context) => const AboutPage(),
        RequestPage.routeName: (context) => const RequestPage(),
        UpdatePage.routeName: (context) => const UpdatePage(),
        DeletePage.routeName: (context) => const DeletePage(),
        CategoryPage.routeName: (context) => CategoryPage(
              initial: ModalRoute.of(context)?.settings.arguments as int,
            ),
      },
    );
  }
}
