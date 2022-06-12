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
          margin: const EdgeInsets.all(10.0),
          width: 170,
          child: Stack(
            children: [
              Positioned(
                bottom: 2.0,
                child: Container(
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinationDetail.name!,
                          style: blackTextStyle,
                        ),
                        Text(
                          destinationDetail.city!,
                          style: greenTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0),
                    ]),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          height: 110,
                          width: 170,
                          image: NetworkImage(
                            destinationDetail.urlImage!,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
