// ignore_for_file: avoid_print

import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Future editDestination(BuildContext context, DestinationDetail destinationDetail) {
  String name = '';
  String rating='';
  String location='';
  String city='';
  String description='';
  String urlWeb='';
  String urlMap='';
  String urlImage = 'https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33';
  String imageName = '';
  //String imgPath ='';
  File? file;
  FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference destinations =
      FirebaseFirestore.instance.collection('destinations');

  //   Future<void> getImage() async {
    

  //   String getPhotoUrl;

  //   final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (img == null) return;

  //   final imageTemporary = File(img.path);

  //   try {
  //     await storage
  //         .ref("photo-users/$imageName/")
  //         .putFile(imageTemporary);
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   }

  //   getPhotoUrl =
  //       await storage.ref("photo-users/$imageName/").getDownloadURL();

  //   Map<String, String> toImageUrl = {
  //     'imageUrl': getPhotoUrl,
  //   };

  //   if (getPhotoUrl.isNotEmpty) {
  //     destinations.doc(destinations.id).update(toImageUrl);
  //   }
  // }

  void _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    file = imageTemporary;
    imageName = img.name;
  }

  void updateDestination() {

    Map<String, String> toName = {
      'name': name,
    };

    Map<String, String> toRating = {
      'rating': rating,
    };

    Map<String, String> toDescription = {
      'description': description,
    };

    Map<String, String> toLocation = {
      'location': location,
    };

    Map<String, String> toCity = {
      'city': city,
    };

    Map<String, String> tourlWeb = {
      'urlWeb': urlWeb,
    };

    Map<String, String> tourlMap = {
      'urlMap': urlMap,
    };

    if (name.isNotEmpty) {
      destinations.doc(destinations.id).update(toName).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (rating.isNotEmpty) {
      destinations.doc(destinations.id).update(toRating).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (description.isNotEmpty) {
      destinations.doc(destinations.id).update(toDescription).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (location.isNotEmpty) {
      destinations.doc(destinations.id).update(toLocation).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (city.isNotEmpty) {
      destinations.doc(destinations.id).update(toCity).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (urlWeb.isNotEmpty) {
      destinations.doc(destinations.id).update(tourlWeb).whenComplete(
            () => print("Update Successful"),
          );
    }

    if (urlMap.isNotEmpty) {
      destinations.doc(destinations.id).update(tourlMap).whenComplete(
            () => print("Update Successful"),
          );
    }
  }

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Destination', style: blackTextStyle),
          content: SizedBox(
              width: 400,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: const Alignment(1.1, 1.1),
                      children: [
                        CircleAvatar(
                          backgroundImage: (file != null
                              ? FileImage(file!)
                              : NetworkImage(urlImage)) as ImageProvider,
                          radius: 72,
                        ),
                        IconButton(
                            iconSize: 33,
                            onPressed: () {
                              _getImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: primaryColor,
                            )),
                      ],
                    ),
                    Text('Name', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.name}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Rating', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        rating = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.rating}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Location', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        location = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.location}'),
                    ),
                    Text('City', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        city = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.city}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Description', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        description = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.description}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Website Resmi', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        urlWeb = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.urlWeb}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Google Map', style: blackTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        urlMap = value;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${destinationDetail.urlMap}'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  if ((imageName != '') && (file != null)) {
                      await storage
                          .ref('photo-upload/$imageName')
                          .putFile(file!);

                      String getDownloadUrl = await storage
                          .ref('photo-upload/$imageName')
                          .getDownloadURL();

                      String imgPath = 'photo-upload/$imageName';
                      
                  updateDestination();
                  if (
                      name.isNotEmpty ||
                      rating.isNotEmpty ||
                      location.isNotEmpty||
                      description.isNotEmpty ||
                      city.isNotEmpty ||
                      urlWeb.isNotEmpty||
                      urlMap.isNotEmpty||
                      getDownloadUrl.isNotEmpty||
                      imgPath.isNotEmpty) {
                    Fluttertoast.showToast(msg: 'Update Successful');
                  }}
                  Navigator.of(context).pop();
                },
                child: Text('Update', style: blackTextStyle)),
          ],
        );
      });
}
