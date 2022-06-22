import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/home/bottom_bar.dart';
import 'package:capstone_project_sib_kwi/presentation/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isHiddenPassword = true;
  final _auth = FirebaseAuth.instance;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  registerSubmit() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.toString().trim(),
              password: _passwordController.text)
          .then((value) => {postDetailsToFirestore()});
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), gravity: ToastGravity.TOP);
    }
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
              margin: const EdgeInsets.only(top: 40),
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
                child: TextFormField(
                  controller: _nicknameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("First Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 3 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nicknameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nickname",
                    prefixIcon: Icon(Icons.person),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _emailController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: isHiddenPassword,
                  controller: _passwordController,
                  validator: (value) {
                    // ignore: unnecessary_new
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                  },
                  onSaved: (value) {
                    _passwordController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
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
            Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: isHiddenPassword,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPasswordController.text = value!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Confirm Password",
                      prefixIcon: const Icon(Icons.security),
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: const Icon(
                            Icons.visibility,
                          ))),
                )),
            const SizedBox(height: 10),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: raisedButtonStyle,
                    child: const Text("Register"),
                    onPressed: () {
                      registerSubmit();
                    })),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text("Have an account ? "),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  "SignIn",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ]),
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

  postDetailsToFirestore() async {
    // memanggil firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // inisialisasi value
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nickname = _nicknameController.text;

    // memanggil user model & mengirim value
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const BottomBar()),
        (route) => false);
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
