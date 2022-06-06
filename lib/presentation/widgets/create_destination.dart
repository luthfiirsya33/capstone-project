// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CreateDestination extends StatefulWidget {
//   static const routeName = '/create_destination';
//
//   @override
//   _CreateDestinationState createState() => _CreateDestinationState();
// }
//
// class _CreateDestinationState extends State<CreateDestination> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ratingController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   String _urlImage =
//       "https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33";
//   String _imageName = "";
//   File? _file;
//   FirebaseStorage _storage = FirebaseStorage.instance;
//   final CollectionReference _destinations =
//       FirebaseFirestore.instance.collection('destinations');
//
//   void _getImage() async {
//     final img = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (img == null) return;
//
//     final imageTemporary = File(img.path);
//
//     setState(() {
//       _file = imageTemporary;
//       _imageName = img.name;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomSheet(
//         onClosing: () {},
//         builder: (context) {
//           return SingleChildScrollView(
//               child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 20,
//                       left: 20,
//                       right: 20,
//                       bottom: MediaQuery.of(context).viewInsets.bottom + 20),
//                   child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Stack(
//                               alignment: Alignment(1.4, 1.4),
//                               children: [
//                                 CircleAvatar(
//                                   backgroundImage: (_file != null
//                                           ? FileImage(_file!)
//                                           : NetworkImage(_urlImage))
//                                       as ImageProvider,
//                                   radius: 75,
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       _getImage();
//                                     },
//                                     icon: const Icon(
//                                       Icons.camera_alt,
//                                       color: Colors.black,
//                                     )),
//                               ],
//                             ),
//                           ],
//                         ),
//                         TextField(
//                           controller: _nameController,
//                           decoration: const InputDecoration(
//                               labelText: 'Nama Destinasi'),
//                         ),
//                         TextField(
//                           keyboardType: const TextInputType.numberWithOptions(
//                               decimal: true),
//                           controller: _ratingController,
//                           decoration: const InputDecoration(
//                             labelText: 'Rating',
//                           ),
//                         ),
//                         TextField(
//                           controller: _locationController,
//                           decoration:
//                               const InputDecoration(labelText: 'Lokasi'),
//                         ),
//                         TextField(
//                           controller: _descriptionController,
//                           decoration:
//                               const InputDecoration(labelText: 'Deskripsi'),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         ElevatedButton(
//                           child: Text('Create'),
//                           onPressed: () {
//                             if ((_imageName != '') && (_file != null)) {
//                               _storage
//                                   .ref('photo-upload/${_imageName}')
//                                   .putFile(_file!);
//
//                               String getDownloadUrl = _storage
//                                   .ref('photo-upload/${_imageName}')
//                                   .getDownloadURL() as String;
//
//                               _destinations.add({
//                                 "name": _nameController,
//                                 "rating": _ratingController,
//                                 "location": _locationController,
//                                 "description": _descriptionController,
//                                 "urlImage": getDownloadUrl
//                               });
//                             }
//
//                             Navigator.of(context).pop();
//                           },
//                         )
//
//                         // ignore: use_build_context_synchronousl
//                       ])));
//         });
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _ratingController.dispose();
//     _locationController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> createDestination(BuildContext context) async {
  late String name;
  late String rating;
  late String location;
  late String description;

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
                      alignment: const Alignment(1.4, 1.4),
                      children: [
                        CircleAvatar(
                          backgroundImage: (file != null
                              ? FileImage(file!)
                              : NetworkImage(urlImage)) as ImageProvider,
                          radius: 75,
                        ),
                        IconButton(
                            onPressed: () {
                              _getImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
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
                    description = value;
                  },
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
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

                      await destinations.add({
                        "name": name,
                        "rating": rating,
                        "location": location,
                        "description": description,
                        "urlImage": getDownloadUrl
                      });
                    }

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
