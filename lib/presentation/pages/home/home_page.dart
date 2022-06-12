// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/destination_card.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/destination_tile.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/drawer_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      // ignore: avoid_print
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: whiteTextStyle),
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
                                return Card(
                                    child: DestinationCard(destinationDetail));
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
              Container(
                margin: const EdgeInsets.only(left: 14.0),
                child: Text("Popular Destinations",
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    )),
              ),
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
                              child: DestinationTile(destinationDetail));
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
    );
  }
}
