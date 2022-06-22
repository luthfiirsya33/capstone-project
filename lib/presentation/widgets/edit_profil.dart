import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future editProfil(BuildContext context, UserModel loggedUser) {
  User? user = FirebaseAuth.instance.currentUser;

  String nickname = '';
  String instagram = '';
  String linkedIn = '';

  void updateProfile() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);

    Map<String, String> toNickname = {
      'nickname': nickname,
    };

    Map<String, String> toInstagram = {
      'instagram': instagram,
    };

    Map<String, String> toLinkedIn = {
      'linkedIn': linkedIn,
    };

    if (nickname.isNotEmpty) {
      documentReference.update(toNickname).whenComplete(
            // ignore: avoid_print
            () => print("Update Successful"),
          );
    }

    if (instagram.isNotEmpty) {
      documentReference.update(toInstagram).whenComplete(
            // ignore: avoid_print
            () => print("Update Successful"),
          );
    }

    if (linkedIn.isNotEmpty) {
      documentReference.update(toLinkedIn).whenComplete(
            // ignore: avoid_print
            () => print("Update Successful"),
          );
    }
  }

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile', style: blackTextStyle),
          content: SizedBox(
              width: 400,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nickname', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        nickname = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${loggedUser.nickname}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Instagram', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        instagram = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${loggedUser.instagram}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('LinkedIn', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        linkedIn = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${loggedUser.linkedIn}'),
                    ),
                  ],
                ),
              )),
          actions: [
            ElevatedButton(
                onPressed: () {
                  updateProfile();
                  if (nickname.isNotEmpty ||
                      instagram.isNotEmpty ||
                      linkedIn.isNotEmpty) {
                    Fluttertoast.showToast(msg: 'Update Successful');
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Update', style: blackTextStyle)),
          ],
        );
      });
}
