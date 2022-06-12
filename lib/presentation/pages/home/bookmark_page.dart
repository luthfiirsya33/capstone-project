import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks', style: whiteTextStyle),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser?.uid)
            .collection('bookmarks')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                    elevation: 10.0,
                    child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: DestinationDetail(
                              name: data['name'],
                              description: data['description'],
                              location: data['location'],
                              rating: data['rating'].toString(),
                              urlImage: data['urlImage'],
                              urlWeb: data['urlWeb'],
                              city: data["city"]));
                    },
                    child: Column(children: <Widget> [
                      Image.network(data["urlImage"],
                      fit: BoxFit.cover,
                      height: 150,
                      width: 200,),
                      const SizedBox(height: 1,),
                      Text(data["name"],
                      style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    ),),
                    const SizedBox(height: 1,),
                    Text(data["city"],
                      style: greenTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                    ),),
                    ])));
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
