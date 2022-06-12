import 'dart:ui';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final DestinationDetail destinationDetail;
  const DestinationCard(
    this.destinationDetail, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: destinationDetail);
        },
        child: Container(
          width: 300,
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: NetworkImage(
                            destinationDetail.urlImage!,
                          ),
                          fit: BoxFit.cover,
                        )
            ),
          child: Stack(
            children: <Widget> [
              Positioned(
                bottom: 12,
                left: 12,
                child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(alignment: Alignment.centerLeft,
                        height: 30,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(children: <Widget> [
                          const Icon(
                        Icons.location_on,
                        color: greenColor,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        destinationDetail.city!,
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )

                        ]),),)
                        )),
        //         Container(
        //           // height: 70,
        //           // width: 170,
        //           decoration: BoxDecoration(
        //             color: whiteColor,
        //             borderRadius: BorderRadius.circular(15.0),
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(10.0),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   destinationDetail.name!,
        //                   style: blackTextStyle,
        //                 ),
        //                 Text(
        //                   destinationDetail.city!,
        //                   style: greenTextStyle,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(20.0),
        //             boxShadow: const [
        //               BoxShadow(
        //                   color: Colors.black12,
        //                   offset: Offset(0.0, 2.0),
        //                   blurRadius: 6.0),
        //             ]),
        //         child: Stack(
        //           children: [
        //             ClipRRect(
        //                 borderRadius: BorderRadius.circular(15.0),
        //                 child: Image(
        //                   height: 110,
        //                   width: 140,
        //                   image: NetworkImage(
        //                     destinationDetail.urlImage!,
        //                   ),
        //                   fit: BoxFit.cover,
        //                 )),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // )
            ]
        )));
  }
}