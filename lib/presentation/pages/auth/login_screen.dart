import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/bottom_bar.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/auth/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginSubmit() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const BottomBar()))
              });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), gravity: ToastGravity.TOP);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() {
      Map<String, dynamic> toMap = {
        'uid': _firebaseAuth.currentUser?.uid,
        'email': _firebaseAuth.currentUser?.email,
        'nickname': 'nickname',
      };

      FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser?.uid)
          .get()
          .then((value) {
        var data = value.data();
        if (data == null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(_firebaseAuth.currentUser?.uid)
              .set(toMap);
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Berhasil Masuk'),
        duration: Duration(seconds: 1),
      ));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 25),
              child: const Text(
                "KWI App",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("assets/img/logo-capstone.png"),
                height: 200,
                width: 200,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: isHiddenPassword,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.security),
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: const Icon(
                            Icons.visibility,
                          ))),
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Or'),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 30,
                icon: const Icon(FontAwesomeIcons.google),
                onPressed: () {
                  signInWithGoogle();
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text("Don't have an account ? "),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ]),
            const SizedBox(height: 20),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text('Login'),
                  onPressed: () {
                    loginSubmit();
                  },
                )),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: primaryColor,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6))),
);
