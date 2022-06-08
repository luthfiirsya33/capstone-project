import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const routeName = '/about_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: const Alignment(
              0,
              -1,
            ),
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: primaryColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/logo-capstone.png',
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'KWI (Keanekaragaman Wisata Indonesia) merupakan aplikasi untuk memperkenalkan seluruh UMKM, destinasi wisata, dan budaya di Indonesia kepada turis lokal maupun mancanegara.',
                        style: darkPurpleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 200,
            width: 240,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: primaryColor,
                  spreadRadius: 2,
                  blurRadius: 4,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Grup ID: CPSG-25'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('1. P2211B177 - Dion Sunardi'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('2. P2009A052 - Wadi Wahyudin'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('3. P2007A023 - Luthfi Irsyadurrafi'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('4. P2387A387 - Maulana Aryo Nugroho'),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
