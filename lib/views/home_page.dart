import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/views/drawer_screen.dart';
import 'package:capstone_project_sib_kwi/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

 @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
Future<void> _signOut() async{
   await FirebaseAuth.instance.signOut();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override 
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null){
      // ignore: avoid_print
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(title: const Text("KWI App"),
      backgroundColor: primaryColor,
      actions: <Widget>[
        Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: const Icon(Icons.logout), onPressed: () {
                  _signOut().then((value)=> Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                        builder: (context)=> const LoginScreen())));
                }),
              ],
            ),
      ],
      ),
      drawer: const DrawerScreen(),
      body: const Text(
        'Hello KWI!',
        textAlign: TextAlign.center,
      ));
    }
}