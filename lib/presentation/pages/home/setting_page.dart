// ignore_for_file: library_private_types_in_public_api

import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
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
      ],
    );
  }
}
