import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';

customDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Coming Soon!'),
            content: const Text('This feature will be coming soon!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: blackColor),
                  ))
            ],
          );
        });
  }
