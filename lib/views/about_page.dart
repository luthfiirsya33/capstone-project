import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: primaryColor,
            ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/img/logo-capstone.png"),
                      radius: 50.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Luthfi Irsyadurrafi",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Icon(FontAwesomeIcons.telegram,
                                        size: 40, 
                                        color: Colors.red[700], 
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "@Zbviel",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Icon(FontAwesomeIcons.instagram,
                                        size: 40, 
                                        color: Colors.red[700], 
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "luthfiirsyad30",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Icon(FontAwesomeIcons.gitlab,
                                        size: 40, 
                                        color: Colors.red[700], 
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "@upiirsya33",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(

                                children: <Widget>[
                                  Icon(FontAwesomeIcons.linkedin,
                                        size: 40, 
                                        color: Colors.red[700], 
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Luthfi Irsyad",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}