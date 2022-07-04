
import 'package:capstone_project_sib_kwi/data/models/destination_detail.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/add_remove_bookmark.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  DestinationDetail destinationDetail;

  DetailPage({Key? key, required this.destinationDetail}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: Hero(
                tag: widget.destinationDetail.urlImage!,
                child: Image.network(
                  widget.destinationDetail.urlImage!,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 80),
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
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: primaryColor,
                              height: 4,
                              width: 48,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.destinationDetail.name!,
                                style: kHeading5,
                              ),
                              AddRemoveBookmark(
                                  destinationDetail: widget.destinationDetail,
                                  context: context)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: greenColor,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.destinationDetail.city.toString(),
                                style: kSubtitle,
                              ),
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
                              Text(
                                widget.destinationDetail.rating.toString(),
                                style: kSubtitle,
                              ),
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
                            widget.destinationDetail.description.toString(),
                            style: kBodyText,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: const [],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                      width: 75,
                                      height: 50,
                                      child: Link(
                                        target: LinkTarget.blank,
                                        uri: Uri.parse(
                                            widget.destinationDetail.urlMap!),
                                        builder: (context, followLink) {
                                          return ElevatedButton(
                                            onPressed: followLink,
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        primaryColor),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                        side: const BorderSide(
                                                            color: Colors
                                                                .green)))),
                                            child: const Icon(
                                              Icons.add_location_alt_outlined,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                            // child: Text(
                                            //   'Detail lebih lanjut',
                                            //   style: interText2.copyWith(
                                            //       fontSize: 17, color: Colors.white),
                                            // )
                                          );
                                        },
                                      )),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                      width: 260,
                                      height: 50,
                                      child: ElevatedButton(
                                      onPressed: () async {
                                        var url = Uri.parse(
                                            widget.destinationDetail.urlWeb!);
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          // can't launch url
                                        }
                                      },
                              style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                                 shape: MaterialStateProperty.all<
                                     RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(18.0),
                                               side: const BorderSide(
                                                color: Colors.green)))),
                                     child: Text(
                                           'Detail lebih lanjut',
                                             style: interText2.copyWith(
                                              fontSize: 17,
                                              color: Colors.white),
                                           ),
                                        )
                                     )
                                  ),
                              ],
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
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
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
