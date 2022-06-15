import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/about/about_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/admin_kwi_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/login/login_screen.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  adminCRUD(UserModel user) {
    if (user.uid == 'NQSrVbrJqNPXK05hR4pOcGJe2m22') {
      return DrawerListTile(
        iconData: Icons.admin_panel_settings,
        title: "Admin",
        onTilePressed: () {
          Navigator.pushNamed(context, AdminKWIPage.routeName);
        },
      );
    } else {
      return Text('');
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: primaryColor),
          currentAccountPicture: CircleAvatar(
            radius: 50,
            backgroundImage: (loggedInUser.imageUrl != null
                    ? NetworkImage(loggedInUser.imageUrl!)
                    : const AssetImage("assets/img/logo-capstone.png"))
                as ImageProvider,
          ),
          accountName: Text(
            "${loggedInUser.nickname}",
            style: whiteTextStyle,
          ),
          accountEmail: Text("${loggedInUser.email}", style: whiteTextStyle),
        ),
        DrawerListTile(
          iconData: Icons.person,
          title: 'About',
          onTilePressed: () {
            Navigator.pushNamed(context, AboutPage.routeName);
          },
        ),
        DrawerListTile(
          iconData: Icons.logout,
          title: "Logout",
          onTilePressed: () {
            _signOut().then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen())));
          },
        ),
        adminCRUD(loggedInUser),
      ],
    ));
  }
}
