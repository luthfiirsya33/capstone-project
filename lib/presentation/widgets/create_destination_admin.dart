import 'dart:io';
import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> createDestinationAdmin(BuildContext context) async {
  late String name;
  late String rating;
  late String location;
  late String city;
  late String description;
  late String urlWeb;
  late String urlMap;
  late String category;

  String urlImage =
      "https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33";
  String imageName = "";
  File? file;
  FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference destinations =
      FirebaseFirestore.instance.collection('destinations');

  void _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    file = imageTemporary;
    imageName = img.name;
  }

  await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Nama Destinasi'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    rating = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    location = value;
                  },
                  decoration: const InputDecoration(labelText: 'Lokasi'),
                ),
                TextField(
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: const InputDecoration(labelText: 'Kota'),
                ),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextField(
                  onChanged: (value) {
                    category = value;
                  },
                  decoration: const InputDecoration(labelText: 'Kategori'),
                ),
                TextField(
                  onChanged: (value) {
                    urlWeb = value;
                  },
                  decoration: const InputDecoration(labelText: 'Website Resmi'),
                ),
                TextField(
                  onChanged: (value) {
                    urlMap = value;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Url Google Map'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    if ((imageName != '') && (file != null)) {
                      await storage
                          .ref('photo-upload/$imageName')
                          .putFile(file!);

                      String getDownloadUrl = await storage
                          .ref('photo-upload/$imageName')
                          .getDownloadURL();

                      String imgPath = 'photo-upload/$imageName';

                      await destinations.add({
                        "idDoc": destinations.id,
                        "name": name,
                        "rating": rating,
                        "location": location,
                        "city": city,
                        "description": description,
                        "urlImage": getDownloadUrl,
                        "urlWeb": urlWeb,
                        "urlMap": urlMap,
                        "imgPath": imgPath,
                        "category": category,
                      }).then((value) {
                        destinations.doc(value.id).update({
                          "idDoc": value.id,
                        });
                      });
                    }

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Successfully Added'),
                      duration: Duration(seconds: 1),
                    ));

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
