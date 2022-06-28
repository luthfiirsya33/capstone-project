import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/custom_dialog.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        Profil(loggedUser: loggedUser),
        const SizedBox(height: 150),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: darkGreenColor,
                  child: ListTile(
                    title: const Text('Dark Theme'),
                    textColor: whiteColor,
                    trailing: Switch.adaptive(
                        value: false,
                        onChanged: (value) {
                          // ignore: void_checks
                          return customDialog(context);
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: darkGreenColor,
                  child: ListTile(
                    title: const Text('Scheduling Destination'),
                    textColor: whiteColor,
                    trailing: Switch.adaptive(
                        value: false,
                        onChanged: (value) {
                          // ignore: void_checks
                          return customDialog(context);
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
