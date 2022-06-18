import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/detail/detail_page.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class DeleteDestination extends StatefulWidget {
  final DestinationDetail destinationDetail;
  const DeleteDestination({Key? key, required this.destinationDetail}) : super(key: key);

  @override
  State<DeleteDestination> createState() => _DeleteDestinationState();
}

class _DeleteDestinationState extends State<DeleteDestination> {
  String title = 'AlertDialog';
  bool tapConfirm = false;

  Future<void> deleteDestination() async {
    CollectionReference destinations =
        FirebaseFirestore.instance.collection("destinations");
    FirebaseStorage storage = FirebaseStorage.instance;
    return await storage.ref(widget.destinationDetail.imgPath).delete().then((value) {
      destinations.doc(widget.destinationDetail.idDoc).delete().whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Deleted the Destination'),
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
                    icon: const Icon(Icons.delete),
                    
                    onPressed: () async {
            final action = await AlertDialogs.confirmCancelDialog(context, 'Delete this Destination', 'are you sure ?');
            if(action == DialogAction.confirm) {
              deleteDestination();
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
