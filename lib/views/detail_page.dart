import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_sib_kwi/common/constants.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  DestinationDetail destinationDetail;

   DetailPage({Key? key, required this.destinationDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(data);
    return Scaffold(
      //backgroundColor: kColorBlue,
      body: SafeArea(
        child: Stack(
          children: [
           SizedBox(
            child: Hero(
             tag: destinationDetail.urlImage,
             child: Image.network(
             destinationDetail.urlImage,
             width: MediaQuery.of(context).size.width,
             height: 400,
             fit: BoxFit.cover,
               ),
              ),
             ),
            ListView(
              children: [
                const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 80),
                ),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                    ),
                    child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          destinationDetail.name!,
                          style: kHeading5,
                        ),
                        const SizedBox(
                          height: 15,
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
                        const SizedBox(
                          height: 2,
                        ),
                       Container(
                        margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Text(
                          "Deskripsi Wisata",
                          style: kHeading6,
                        )),
                       const SizedBox(
                          height: 10,
                        ),
                        Text(
                          destinationDetail.description.toString(),
                          style: kBodyText,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: const [
                            // Column(
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(12.0),
                            //       decoration: const BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: Color(0xffE8F8F5)),
                            //       child:
                            //           Image.asset('assets/icons/pizza (1).png'),
                            //       width: 75,
                            //     ),
                            //     const SizedBox(
                            //       height: 6,
                            //     ),
                            //     const Text(
                            //       'Makanan',
                                  //style: interText2.copyWith(
                                      // fontSize: 18, color: kText),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   width: 16,
                            // ),
                            // Column(
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(12.0),
                            //       decoration: const BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: Color(0xffE8F8F5)),
                            //       child: Image.asset(
                            //           'assets/icons/coffee (1).png'),
                            //       width: 75,
                            //     ),
                            //     const SizedBox(
                            //       height: 6,
                            //     ),
                            //     const Text(
                            //       'Minuman',
                                  //style: interText2.copyWith(
                                     // fontSize: 18, color: kText),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   width: 16,
                            // ),
                            // Column(
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(12.0),
                            //       decoration: const BoxDecoration(
                            //           shape: BoxShape.circle,
                            //           color: Color(0xffE8F8F5)),
                            //       child: Image.asset('assets/icons/wifi.png'),
                            //       width: 75,
                            //     ),
                            //     const SizedBox(
                            //       height: 6,
                            //     ),
                            //     const Text(
                            //       'Wifi',
                                  // style: interText2.copyWith(
                                  //     fontSize: 18, color: kText),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 56,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(primaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.green)
                                  )
                                )
                              ),
                              child:  Text(
                                'Jelajah Lokasinya Sekarang!',
                                 style: interText2.copyWith(
                                     fontSize: 17, color: Colors.white),
                              )
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () async {
                        Navigator.of(context, rootNavigator: true).pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}