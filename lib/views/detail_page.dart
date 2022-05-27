import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_app/common/style.dart';
// import 'package:restaurant_app/data/model/detail_resto.dart';
// import 'package:restaurant_app/provider/database_provider.dart';
// import 'package:restaurant_app/ui/error_screen.dart';
// import 'package:restaurant_app/utils/convert_data.dart';

class DetailPage extends StatelessWidget {

  const DetailPage({Key? key}) : super(key: key);

  //final DetailResto restaurant;

  //const DetailRestoPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme: Theme.of(context).colorScheme.copyWith(
             // primary: primaryColor,
              onPrimary: Colors.black,
              //secondary: secondaryColor,
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
                        const SizedBox(
                          // child: Hero(
                          //   tag: restaurant.pictureId,
                          //   child: Image.network(
                          //     _urlPicture + restaurant.pictureId,
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 300,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
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
                  children: const [
                    // Text(
                    //   restaurant.name,
                    //   style: kTitle.copyWith(fontSize: 18),
                    // ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_pin,
                      //color: locationColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    //Text(restaurant.city),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.star_rate,
                      //color: starColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    //Text(restaurant.rating.toString(),)
                  ],
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                    child: const Text(
                      "Description",
                     // style: kTitle,
                    )),
                Card(
                  elevation: 4,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    //child: Text(restaurant.description),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: const Text(
                    "Menu",
                    //style: kTitle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: const Text(
                    "Food",
                    // style: ktitle.copyWith(
                    //   color: kColorFour,
                    ),
                  ),
                //),
               // listMenu(restaurant.menus.foods),
                Container(
                  margin: const EdgeInsets.fromLTRB(4, 16, 0, 0),
                  child: const Text(
                    "Drink",
                    // style: ktitle.copyWith(
                    //   color: kColorFour,
                    // ),
                  ),
                ),
               // listMenu(restaurant.menus.drinks),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: const Text('Pesan Sekarang',
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

  listMenu(List<dynamic> menus) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: menus.map((list) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://blogunik.com/wp-content/uploads/2019/02/Makanan-Dan-Minuman-Khas-Bandung.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(list.name))
              ]);
        }).toList(),
      ),
    );
  }
}
