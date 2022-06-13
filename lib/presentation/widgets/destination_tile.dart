import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final DestinationDetail destinationDetail;

  const DestinationTile(
    this.destinationDetail, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destinationDetail: destinationDetail,
            ),
          ),
        );
      },
      child: Container(
        //margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destinationDetail.urlImage!,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationDetail.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: greenColor,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        destinationDetail.city!,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0, 0, 2, 4),
                  child: const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 8, 0),
                  child: Text(
                    destinationDetail.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
