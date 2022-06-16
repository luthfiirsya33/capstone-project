import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/delete_destination.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  static const routeName = '/Delete_page';
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<DeletePage> {
  final CollectionReference _destinations =
      FirebaseFirestore.instance.collection('destinations');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Delete'),
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
                      child: DeleteDestination(destinationDetail: destinationDetail,
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
