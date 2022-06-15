import 'package:flutter/material.dart';

class AdminKWIPage extends StatefulWidget {
  static const routeName = '/admin_page';
  const AdminKWIPage({Key? key}) : super(key: key);

  @override
  _AdminKWIState createState() => _AdminKWIState();
}

class _AdminKWIState extends State<AdminKWIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Center(
        child: Text('Admin KWI'),
      ),
    );
  }
}
