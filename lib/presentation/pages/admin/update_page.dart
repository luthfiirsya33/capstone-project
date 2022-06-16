// ignore_for_file: library_private_types_in_public_api

import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/update_destination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  static const routeName = '/Update_page';
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<UpdatePage> {
  final CollectionReference _destinations =
      FirebaseFirestore.instance.collection('destinations');
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
                      child: UpdateDestination(destinationDetail));
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
