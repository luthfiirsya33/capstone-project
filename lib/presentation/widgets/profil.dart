import 'dart:io';
import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/edit_profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class Profil extends StatelessWidget {
  Profil({Key? key, required this.loggedUser}) : super(key: key);
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser;
  FirebaseStorage storage = FirebaseStorage.instance;
  String urlImage =
      "https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33";

  Future<void> getImage() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);

    String getPhotoUrl;

    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    try {
      await storage
          .ref("photo-users/${loggedUser.uid}/")
          .putFile(imageTemporary);
    } on FirebaseException catch (e) {
      print(e);
    }

    getPhotoUrl =
        await storage.ref("photo-users/${loggedUser.uid}/").getDownloadURL();

    Map<String, String> toImageUrl = {
      'imageUrl': getPhotoUrl,
    };

    if (getPhotoUrl.isNotEmpty) {
      documentReference.update(toImageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: const Alignment(0, 22), children: [
      Container(
        width: double.infinity,
        height: 260,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
        ),
      ),
      Stack(
        alignment: const Alignment(0, -2.5),
        children: [
          Container(
            width: 320,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          editProfil(context, loggedUser);
                        },
                        icon: const Icon(Icons.edit, color: primaryColor))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loggedUser.nickname ?? '',
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            loggedUser.instagram ?? '',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            loggedUser.linkedIn ?? '',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: const Alignment(1.2, 1.2),
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(loggedUser.imageUrl ?? urlImage),
                radius: 70,
                backgroundColor: greenColor,
              ),
              IconButton(
                onPressed: () {
                  getImage();
                },
                icon:
                    const Icon(Icons.camera_alt, size: 32, color: primaryColor),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
