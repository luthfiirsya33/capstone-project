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
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/waterfall.png',
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'KWI APP',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                  title: 'Login',
                  width: 220,
                  margin: EdgeInsets.only(
                    top: 140,
                    bottom: 20,
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                ),
                CustomButton(
                  title: 'Register',
                  width: 220,
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 80,
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}