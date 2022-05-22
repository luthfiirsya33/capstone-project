import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/data/models/user.dart';
import 'package:capstone_project_sib_kwi/views/about_page.dart';
import 'package:capstone_project_sib_kwi/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrawerScreen extends StatefulWidget{
  const DrawerScreen({Key? key}) : super(key: key);
  @override 
  // ignore: library_private_types_in_public_api
  _DrawwerScreenState createState() => _DrawwerScreenState();
}
Future<void> _signOut() async{
   await FirebaseAuth.instance.signOut();
}

class _DrawwerScreenState extends State<DrawerScreen>{
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override 
  Widget build(BuildContext context){
    return Drawer(child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("${loggedInUser.nickname}"),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
            child: Text('KWI'),
            ),
            accountEmail: Text("${loggedInUser.email}"),
            ),
            DrawerListTile(
              iconData: Icons.person,
              title: 'About',
              onTilePressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage(),));
              },
            ),
            DrawerListTile(
              iconData: Icons.logout,
              title: "Logout",
              onTilePressed: (){
                _signOut().then((value)=> Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                        builder: (context)=> LoginScreen())));
              },
            ),
      ],
      )
      );
  }
}

class DrawerListTile extends StatelessWidget{
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({Key? key, this.iconData, this.title, this.onTilePressed})
  :super(key:key);
  @override 
  Widget build(BuildContext context){
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title!, style: const TextStyle(fontSize: 16),),
    );
  }
}