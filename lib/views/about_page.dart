// ignore_for_file: avoid_print

import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseStorage storage = FirebaseStorage.instance;
  UserModel loggedUser = UserModel();
  String _nickname = "";
  String _telegram = "";
  String _instagram = "";
  String _gitlab = "";
  String _linkedIn = "";

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

  void updateProfile() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);

    Map<String, String> toNickname = {
      'nickname': _nickname,
    };

    Map<String, String> toTelegram = {
      'telegram': _telegram,
    };

    Map<String, String> toInstagram = {
      'instagram': _instagram,
    };

    Map<String, String> toGitlab = {
      'gitlab': _gitlab,
    };

    Map<String, String> toLinkedIn = {
      'linkedIn': _linkedIn,
    };

    if (_nickname.isNotEmpty) {
      documentReference.update(toNickname).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (_telegram.isNotEmpty) {
      documentReference.update(toTelegram).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (_instagram.isNotEmpty) {
      documentReference.update(toInstagram).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (_gitlab.isNotEmpty) {
      documentReference.update(toGitlab).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (_linkedIn.isNotEmpty) {
      documentReference.update(toLinkedIn).whenComplete(
            () => print("Update Successful"),
          );
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
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Profile'),
                                        content: Container(
                                            width: 400,
                                            height: 400,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Nickname'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    onChanged: (value) {
                                                      _nickname = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        border:
                                                            const OutlineInputBorder(),
                                                        hintText:
                                                            '${loggedUser.nickname}'),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('Telegram'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    onChanged: (value) {
                                                      _telegram = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        border:
                                                            const OutlineInputBorder(),
                                                        hintText:
                                                            '${loggedUser.telegram}'),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('Instagram'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    onChanged: (value) {
                                                      _instagram = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        border:
                                                            const OutlineInputBorder(),
                                                        hintText:
                                                            '${loggedUser.instagram}'),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('Gitlab'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    onChanged: (value) {
                                                      _gitlab = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        border:
                                                            const OutlineInputBorder(),
                                                        hintText:
                                                            '${loggedUser.gitlab}'),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text('LinkedIn'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    maxLines: 1,
                                                    onChanged: (value) {
                                                      _linkedIn = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        border:
                                                            const OutlineInputBorder(),
                                                        hintText:
                                                            '${loggedUser.linkedIn}'),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  updateProfile();
                                                });
                                                if (_nickname.isNotEmpty ||
                                                    _telegram.isNotEmpty ||
                                                    _instagram.isNotEmpty ||
                                                    _gitlab.isNotEmpty ||
                                                    _linkedIn.isNotEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg: 'Update Successful');
                                                }
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Update'))
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                        ],
                      ),
                      Stack(
                        alignment: const Alignment(1.4, 1.4),
                        children: [
                          CircleAvatar(
                            backgroundImage: (loggedUser.imageUrl != null
                                    ? NetworkImage(loggedUser.imageUrl!)
                                    : AssetImage(
                                        "assets/img/logo-capstone.png"))
                                as ImageProvider,
                            radius: 50.0,
                          ),
                          IconButton(
                              onPressed: () {
                                getImage();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                              )),
                        ],
                      ),
                      // const CircleAvatar(
                      //   backgroundImage:
                      //       AssetImage("assets/img/logo-capstone.png"),
                      //   radius: 50.0,
                      // ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${loggedUser.nickname}",
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.telegram,
                                      size: 40,
                                      color: Colors.red[700],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${loggedUser.telegram}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red[700],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.instagram,
                                      size: 40,
                                      color: Colors.red[700],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${loggedUser.instagram}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red[700],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.gitlab,
                                      size: 40,
                                      color: Colors.red[700],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${loggedUser.gitlab}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red[700],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.linkedin,
                                      size: 40,
                                      color: Colors.red[700],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${loggedUser.linkedIn}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red[700],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
