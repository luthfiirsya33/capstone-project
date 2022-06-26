import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/bottom_bar.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/detail_page.dart';
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
        title: Text('Bookmarks', style: darkPurpleTextStyle),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser?.uid)
            .collection('bookmarks')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return Card(
                      elevation: 10.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, DetailPage.routeName,
                                arguments: DestinationDetail(
                                    idDoc: data["id"],
                                    name: data['name'],
                                    description: data['description'],
                                    location: data['location'],
                                    rating: data['rating'].toString(),
                                    urlImage: data['urlImage'],
                                    urlWeb: data['urlWeb'],
                                    city: data["city"],
                                    urlMap: data["urlMap"],
                                    category: data["category"]));
                          },
                          child: Column(children: <Widget>[
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                      image: NetworkImage(data["urlImage"]),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 12, left: 10),
                              height: 70,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data["name"],
                                    style: blackTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, right: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: greenColor,
                                              size: 17,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              data["city"],
                                              style: greyTextStyle.copyWith(
                                                fontWeight: light,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
