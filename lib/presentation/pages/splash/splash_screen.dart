import 'package:capstone_project_sib_kwi/presentation/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 9), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Lottie.asset("assets/splash.json"),
        ),
      ),
    );
  }
}
