import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  static const routeName = '/request_page';
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request'),
      ),
      body: Center(
        child: Text('Request Admin KWI'),
      ),
    );
  }
}
