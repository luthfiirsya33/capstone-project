import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/request_destinations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  static const routeName = '/Request_page';
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<RequestPage> {
  final CollectionReference _requestdestinations =
      FirebaseFirestore.instance.collection('request-destinations');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request'),
        ),
        body: SingleChildScrollView(
            child: StreamBuilder(
          stream: _requestdestinations.snapshots(),
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
                      child: RequestDestination(destinationDetail: destinationDetail,
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
