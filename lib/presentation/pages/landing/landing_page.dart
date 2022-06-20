import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/login/login_screen.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/register/register_screen.dart';
import 'package:capstone_project_sib_kwi/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //  /width: double.infinity,
          //   height: double.infinity,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: AssetImage(
          //         'assets/leaf2.png',
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
          width: 500,
          height: 900,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset('assets/leaf2.png'),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(80), // Image radius
                        child:
                            Image.asset('assets/img/logo-capstone.png', fit: BoxFit.cover),
                      ),
                    ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'KWI APP',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Explore new destination in Indonesian with us and get a vacation',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  title: 'Get Started',
                  width: 250,
                  margin: const EdgeInsets.only(
                    top: 100,
                    bottom: 10,
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                ),
                const SizedBox(
                  height: 190,
                ),
          //       CustomButton(
          //         title: 'Register',
          //         width: 220,
          //         margin: const EdgeInsets.only(
          //           top: 20,
          //           bottom: 80,
          //         ),
          //         onPressed: () {
          //            Navigator.push(context,
          // MaterialPageRoute(builder: (context) => const RegisterScreen()));
          //         },
          //       ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}