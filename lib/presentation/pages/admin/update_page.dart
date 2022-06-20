
import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';


class UpdatePage extends StatefulWidget {
  static const routeName = '/Update_page';
  const UpdatePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _urlWebController = TextEditingController();
  final TextEditingController _urlMapController = TextEditingController();

  String urlImage =
      "https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33";
  String imageName = "";
  File? file;
  FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference _destinations =
      FirebaseFirestore.instance.collection('destinations');
  void _getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;

    final imageTemporary = File(img.path);

    file = imageTemporary;
    imageName = img.name;
  }

  Future<void> _updateDestination([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'];
      _ratingController.text = documentSnapshot['rating'];
      _locationController.text = documentSnapshot['location'];
      _descriptionController.text = documentSnapshot['description'];
      _cityController.text = documentSnapshot['city'];
      _urlWebController.text = documentSnapshot['urlWeb'];
      _urlMapController.text = documentSnapshot['urlMap'];
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
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama Destinasi'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                  ),
                ),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Lokasi'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Kota',
                  ),
                ),
                TextField(
                  controller: _urlWebController,
                  decoration: const InputDecoration(labelText: 'Web Resmi'),
                ),
                TextField(
                  controller: _urlMapController,
                  decoration: const InputDecoration(labelText: 'Google Map'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    if ((imageName != '') && (file != null)) {
                      await storage
                          .ref('photo-upload/$imageName')
                          .putFile(file!);

                      String getDownloadUrl = await storage
                          .ref('photo-upload/$imageName')
                          .getDownloadURL();

                      String imgPath = 'photo-upload/$imageName';
                    final String name = _nameController.text;
                    final String rating = _ratingController.text;
                    final String location = _locationController.text;
                    final String description = _descriptionController.text;
                    final String city = _cityController.text;
                    final String urlWeb = _urlWebController.text;
                    final String urlMap = _urlMapController.text;
                    if (action == 'create') {
                      await _destinations.add({"name": name, 
                                              "rating": rating, 
                                              "location": location, 
                                              "description": description, 
                                              "city":city, "urlWeb":urlWeb, 
                                              "urlMap":urlMap, 
                                              "imgPath":imgPath, 
                                              "urlImage":getDownloadUrl
                                              });
                    }

                    if (action == 'update') {
                      await _destinations
                          .doc(documentSnapshot!.id)
                          .update({"name": name, 
                                  "rating": rating, 
                                  "location": location, 
                                  "description": description, 
                                  "city":city, "urlWeb":urlWeb, 
                                  "urlMap":urlMap, 
                                  "imgPath":imgPath, 
                                  "urlImage":getDownloadUrl
                                  });}


                    _nameController.text = '';
                    _ratingController.text = '';
                    _locationController.text = '';
                    _descriptionController.text = '';
                    _cityController.text ='';
                    _urlWebController.text='';
                    _urlMapController.text='';

                    
                    Navigator.of(context).pop();
}
                  },
                )
              ],
            ),
          ));
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update'),
        ),
        body: SingleChildScrollView(
            child: StreamBuilder(
          stream: _destinations.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  var destinationDetail = toDestination(documentSnapshot);
                  return Card(
          margin: const EdgeInsets.all(10),
                  child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destinationDetail: destinationDetail,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destinationDetail.urlImage!,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationDetail.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: greenColor,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        destinationDetail.city!,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () {
                  _updateDestination(documentSnapshot);
                }),
              ],
            ),
          ],
        ),
      ),
    ));
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )));
  }
  

}