import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_sib_kwi/common/constants.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  DestinationDetail destinationDetail;

   DetailPage({Key? key, required this.destinationDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: greenColor,
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          const SizedBox(width: 10),
                           SizedBox(
                              child: Hero(
                                tag: destinationDetail.urlImage,
                                child: Image.network(
                                    destinationDetail.urlImage,
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () async {
                                  Navigator.of(context, rootNavigator: true).pop(context);
                                },

                              ),
                            ),
                          ),
                          // Consumer<DatabaseProvider>(
                          //     builder: (context, provider, child) {
                          //   return FutureBuilder<bool>(
                          //       future: provider.isBookmarked(restaurant.id),
                          //       builder: (context, snapshot) {
                          //         var isBookmarked = snapshot.data ?? false;
                          //         return ListTile(
                          //           trailing: isBookmarked
                          //               ? IconButton(
                          //                   icon: const Icon(
                          //                     Icons.favorite,
                          //                     color: Colors.deepOrange,
                          //                     size: 40.0,
                          //                   ),
                          //                   onPressed: () => provider
                          //                       .removeRestaurant(restaurant.id),
                          //                 )
                          //               : IconButton(
                          //                   icon: const Icon(
                          //                     Icons.favorite_border,
                          //                     color: Colors.deepOrange,
                          //                     size: 40.0,
                          //                   ),
                          //                   onPressed: () =>
                          //                       provider.addRestaurant(
                          //                           convertData(restaurant)),
                          //                 ),
                          //         );
                          //       });
                          // }),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ];
            },
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(destinationDetail.name!,
                        style: kHeading5,),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: greyColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(destinationDetail.location.toString(),
                        style: kSubtitle,),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(
                          Icons.star_rate,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(destinationDetail.rating.toString(),
                        style: kSubtitle,),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                        child: Text(
                          "Description",
                          style: kHeading6,
                        )),
                    // Card(
                    //   child: Container(
                    //     margin: const EdgeInsets.all(2),
                    //     child: Text(destinationDetail.description.toString()),
                    //   ),
                    // ),
                    Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      destinationDetail.description.toString(),
                      style: kBodyText,
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    //   child: const Text(
                    //     "Fasilitas",
                    //     style: kTitle,
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    //   child: const Text(
                    //     "Restaurant",
                    //     style: ktitle.copyWith(
                    //       color: kColorFour,
                    //   ),
                    // ),
                    //),
                    // listMenu(restaurant.menus.foods),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    //   child: const Text(
                    //     "Wisata",
                    //     style: ktitle.copyWith(
                    //       color: kColorFour,
                    //     ),
                    //   ),
                    // ),
                    // listMenu(restaurant.menus.drinks),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: greenColor, // background // foreground
                        ),
                        child: const Text('Jelajah Sekarang',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const ErrorScreen(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    //],
                  ],
                ),
              ),
            )),
      ),
    );
    //);
  }

  // listMenu(List<dynamic> menus) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: menus.map((list) {
  //         return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 margin: const EdgeInsets.all(4),
  //                 height: 150,
  //                 width: 150,
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(10),
  //                   child: Image.network(
  //                     "https://blogunik.com/wp-content/uploads/2019/02/Makanan-Dan-Minuman-Khas-Bandung.jpg",
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                   margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
  //                   child: Text(list.name))
  //             ]);
  //       }).toList(),
  //     ),
  //   );
  // }
}