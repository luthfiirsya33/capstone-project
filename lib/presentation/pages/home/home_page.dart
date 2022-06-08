// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/drawer_screen.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/create_destination.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/search/search_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// Future<void> _signOut() async {
//   await FirebaseAuth.instance.signOut();
// }

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String urlImage =
      "https://firebasestorage.googleapis.com/v0/b/capstone-project-kwi.appspot.com/o/photo-upload%2Flogo-capstone.png?alt=media&token=fa92a44f-6e38-42bd-af57-fa29991f6e33";
  File? file;
  String imageName = "";
  final CollectionReference _destinations =
      FirebaseFirestore.instance.collection('destinations');

  // Future<void> _createUpdateDestination(
  //     [DocumentSnapshot? documentSnapshot]) async {
  //   String action = 'create';
  //   if (documentSnapshot != null) {
  //     action = 'update';
  //     _nameController.text = documentSnapshot['name'];
  //     _ratingController.text = documentSnapshot['rating'].toString();
  //     _locationController.text = documentSnapshot['location'];
  //     _descriptionController.text = documentSnapshot['description'];
  //     _priceController.text = documentSnapshot['price'].toString();
  //     urlImage = documentSnapshot['urlImage'];
  //   }
  //
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return SingleChildScrollView(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //                 top: 20,
  //                 left: 20,
  //                 right: 20,
  //                 bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Stack(
  //                       alignment: Alignment(1.4, 1.4),
  //                       children: [
  //                         CircleAvatar(
  //                           backgroundImage: (file != null
  //                               ? FileImage(file!)
  //                               : NetworkImage(urlImage)) as ImageProvider,
  //                           radius: 75,
  //                         ),
  //                         IconButton(
  //                             onPressed: () {
  //                               getImage();
  //                             },
  //                             icon: const Icon(
  //                               Icons.camera_alt,
  //                               color: Colors.black,
  //                             )),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 TextField(
  //                   controller: _nameController,
  //                   decoration:
  //                       const InputDecoration(labelText: 'Nama Destinasi'),
  //                 ),
  //                 TextField(
  //                   keyboardType:
  //                       const TextInputType.numberWithOptions(decimal: true),
  //                   controller: _ratingController,
  //                   decoration: const InputDecoration(
  //                     labelText: 'Rating',
  //                   ),
  //                 ),
  //                 TextField(
  //                   controller: _locationController,
  //                   decoration: const InputDecoration(labelText: 'Lokasi'),
  //                 ),
  //                 TextField(
  //                   controller: _descriptionController,
  //                   decoration: const InputDecoration(labelText: 'Deskripsi'),
  //                 ),
  //                 TextField(
  //                   keyboardType:
  //                       const TextInputType.numberWithOptions(decimal: false),
  //                   controller: _priceController,
  //                   decoration: const InputDecoration(
  //                     labelText: 'Harga',
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 ElevatedButton(
  //                   child: Text(action == 'create' ? 'Create' : 'Update'),
  //                   onPressed: () async {
  //                     final String? name = _nameController.text;
  //                     final double? rating =
  //                         double.tryParse(_ratingController.text);
  //                     final String? location = _locationController.text;
  //                     final String? description = _descriptionController.text;
  //                     final double? price =
  //                         double.tryParse(_priceController.text);
  //                     if (name != null &&
  //                         rating != null &&
  //                         location != null &&
  //                         description != null &&
  //                         price != null) {
  //                       if (action == 'create') {
  //                         if ((imageName != "") && (file != null)) {
  //                           await storage
  //                               .ref('photo-upload/${imageName}')
  //                               .putFile(file!);
  //
  //                           String getDownloadUrl = await storage
  //                               .ref('photo-upload/${imageName}')
  //                               .getDownloadURL();
  //
  //                           await _destinations.add({
  //                             "name": name,
  //                             "rating": rating,
  //                             "location": location,
  //                             "description": description,
  //                             "price": price,
  //                             "urlImage": getDownloadUrl,
  //                           });
  //                         }
  //                       }
  //
  //                       if (action == 'update') {
  //                         await _destinations.doc(documentSnapshot!.id).update({
  //                           "name": name,
  //                           "rating": rating,
  //                           "location": location,
  //                           "description": description,
  //                           "price": price
  //                         });
  //                       }
  //
  //                       _nameController.text = '';
  //                       _ratingController.text = '';
  //                       _locationController.text = '';
  //                       _descriptionController.text = '';
  //                       _priceController.text = '';
  //
  //                       // ignore: use_build_context_synchronously
  //                       Navigator.of(context).pop();
  //                     }
  //                   },
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // Future<void> _deleteDestination(String destinationId) async {
  //   await _destinations.doc(destinationId).delete();
  //
  //   // ignore: use_build_context_synchronously
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('You have successfully deleted the destination')));
  // }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // ignore: avoid_print
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("KWI App", style: whiteTextStyle),
        backgroundColor: primaryColor,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: SearchPage());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 200,
                  child: StreamBuilder(
                      stream: _destinations.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                              itemCount: streamSnapshot.data!.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                var destinationDetail =
                                    toDestination(documentSnapshot);
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, DetailPage.routeName,
                                          arguments: destinationDetail);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      width: 170,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 2.0,
                                            child: Container(
                                              height: 70,
                                              width: 170,
                                              decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      documentSnapshot['name'],
                                                      style: blackTextStyle,
                                                    ),
                                                    Text(
                                                      documentSnapshot['city'],
                                                      style: greenTextStyle,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0.0, 2.0),
                                                      blurRadius: 6.0),
                                                ]),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    child: Image(
                                                      height: 110,
                                                      width: 170,
                                                      image: NetworkImage(
                                                        documentSnapshot[
                                                            'urlImage'],
                                                      ),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
              Text("  Popular Destinations",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  )),
              Flexible(
                child: StreamBuilder(
                  stream: _destinations.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          var destinationDetail =
                              toDestination(documentSnapshot);
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailPage.routeName,
                                    arguments: destinationDetail);
                              },
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 55,
                                  minHeight: 55,
                                  maxWidth: 70,
                                  maxHeight: 70,
                                ),
                                child: Image.network(
                                    documentSnapshot['urlImage'],
                                    fit: BoxFit.cover),
                              ),
                              title: Text(
                                documentSnapshot['name'],
                                style: blackTextStyle,
                              ),
                              subtitle: Column(
                                children: [
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: greyColor,
                                        size: 17,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        documentSnapshot['city'],
                                        style: greyTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 17,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        documentSnapshot['rating'].toString(),
                                        style: greyTextStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // trailing: SizedBox(
                              //   width: 100,
                              //   child: Row(
                              //     children: [
                              //       IconButton(
                              //           icon: const Icon(Icons.edit),
                              //           onPressed: () =>
                              //               _createUpdateDestination(
                              //                   documentSnapshot)),
                              //       IconButton(
                              //           icon: const Icon(Icons.delete),
                              //           onPressed: () => _deleteDestination(
                              //               documentSnapshot.id)),
                              //     ],
                              //   ),
                              // ),
                            ),
                          );
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => createDestination(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
