import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/detail_page.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestDestination extends StatefulWidget {
  final DestinationDetail destinationDetail;
  const RequestDestination({Key? key, required this.destinationDetail})
      : super(key: key);

  @override
  State<RequestDestination> createState() => _RequestDestinationState();
}

class _RequestDestinationState extends State<RequestDestination> {
  String title = 'AlertDialog';
  bool tapConfirm = false;

  Future<void> approveDestination() async {
    Map<String, dynamic> toDes = {
      "idDoc": widget.destinationDetail.idDoc,
      "name": widget.destinationDetail.name,
      "rating": widget.destinationDetail.rating,
      "location": widget.destinationDetail.location,
      "city": '',
      "description": widget.destinationDetail.description,
      "urlImage": widget.destinationDetail.urlImage,
      "urlWeb": '',
      "urlMap": '',
      "imgPath": widget.destinationDetail.imgPath,
      "category": '',
    };
    FirebaseFirestore destinations = FirebaseFirestore.instance;
    return await destinations
        .collection('destinations')
        .doc()
        .set(toDes)
        .then((value) {
      return destinations
          .collection('request-destinations')
          .doc(widget.destinationDetail.idDoc)
          .delete()
          .whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Approved the Destination'),
          duration: Duration(seconds: 1),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destinationDetail: widget.destinationDetail,
            ),
          ),
        );
      },
      child: Container(
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
                    widget.destinationDetail.urlImage!,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destinationDetail.name!,
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
                        widget.destinationDetail.city!,
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
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () async {
                    final action = await AlertDialogs.confirmCancelDialog(
                        context, 'Approve this Destination', 'are you sure ?');
                    if (action == DialogAction.confirm) {
                      approveDestination();
                    } else {
                      setState(() => tapConfirm = false);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
