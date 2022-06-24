// ignore_for_file: library_private_types_in_public_api

import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/destination_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category_page';
  final int initial;

  const CategoryPage({Key? key, required this.initial}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final CollectionReference _destinations =
      FirebaseFirestore.instance.collection('destinations');

  @override
  void initState() {
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.initial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  indicatorWeight: 3,
                  tabs: const [
                    SizedBox(
                        width: 120,
                        child: Tab(
                          text: 'Taman Nasional',
                          height: 32,
                        )),
                    SizedBox(
                        width: 120,
                        child: Tab(
                          text: 'Pantai',
                          height: 32,
                        )),
                    SizedBox(
                        width: 120,
                        child: Tab(
                          text: 'Kuliner',
                          height: 32,
                        )),
                    SizedBox(
                        width: 120,
                        child: Tab(
                          text: 'Gunung',
                          height: 32,
                        )),
                  ]),
              SizedBox(
                height: MediaQuery.of(context).size.height - 160,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: StreamBuilder(
                        stream: _destinations
                            .where('category', isEqualTo: 'Taman Nasional')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                    ),
                    SingleChildScrollView(
                      child: StreamBuilder(
                        stream: _destinations
                            .where('category', isEqualTo: 'Pantai')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                    ),
                    SingleChildScrollView(
                      child: StreamBuilder(
                        stream: _destinations
                            .where('category', isEqualTo: 'Kuliner')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                    ),
                    SingleChildScrollView(
                      child: StreamBuilder(
                        stream: _destinations
                            .where('category', isEqualTo: 'Gunung')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
