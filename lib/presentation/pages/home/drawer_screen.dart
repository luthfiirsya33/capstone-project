import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/about_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/delete_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/request_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/admin/update_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/auth/login_screen.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/alert_dialog.dart';
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
  String title = 'AlertDialog';
  bool tapConfirm = false;

  adminCRUD(UserModel user) {
    if (user.uid == 'NQSrVbrJqNPXK05hR4pOcGJe2m22') {
      return ExpansionTile(
        leading: const Icon(Icons.admin_panel_settings),
        title: const Text("Admin"),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.request_page),
            title: const Text('Request'),
            onTap: () {
              Navigator.pushNamed(context, RequestPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Update'),
            onTap: () {
              Navigator.pushNamed(context, UpdatePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pushNamed(context, DeletePage.routeName);
            },
          ),
        ],
      );
    } else {
      return const Text('');
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
        adminCRUD(loggedInUser),
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
          onTilePressed: () async {
            final action = await AlertDialogs.confirmCancelDialog(
                context, 'Logout', 'are you sure ?');
            if (action == DialogAction.confirm) {
              _signOut().then((value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen())));
            } else {
              setState(() => tapConfirm = false);
            }
          },
        ),
      ],
    ));
  }
}
