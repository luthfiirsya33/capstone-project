import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddRemoveBookmark extends StatelessWidget {
  DestinationDetail destinationDetail;
  User? currentUser = FirebaseAuth.instance.currentUser;
  BuildContext context;

  AddRemoveBookmark(
      {Key? key, required this.destinationDetail, required this.context})
      : super(key: key);

  Future addBookmark() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users");
    return await collectionRef
        .doc(currentUser?.uid)
        .collection("bookmarks")
        .doc(destinationDetail.idDoc)
        .set({
      "name": destinationDetail.name,
      "city": destinationDetail.city,
      "urlImage": destinationDetail.urlImage,
      "rating": double.parse(destinationDetail.rating!),
      "id": destinationDetail.idDoc,
      "description": destinationDetail.description,
      "location": destinationDetail.location,
      "urlWeb": destinationDetail.urlWeb,
      "urlMap": destinationDetail.urlMap,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Added to Bookmarks'),
        duration: Duration(seconds: 1),
      ));
    });
  }

  Future deleteBookmark() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users");
    return await collectionRef
        .doc(currentUser?.uid)
        .collection("bookmarks")
        .doc(destinationDetail.idDoc)
        .delete()
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Removed from Bookmarks'),
        duration: Duration(seconds: 1),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser?.uid)
            .collection('bookmarks')
            .where('id', isEqualTo: destinationDetail.idDoc)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            return IconButton(
              onPressed: () => snapshot.data!.docs.isEmpty
                  ? addBookmark()
                  : deleteBookmark(),
              icon: snapshot.data!.docs.isEmpty
                  ? const Icon(
                      Icons.bookmark_outline,
                      size: 32,
                    )
                  : const Icon(
                      Icons.bookmark,
                      size: 32,
                    ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
