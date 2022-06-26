import 'dart:io';

import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:capstone_project_sib_kwi/common/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customDialog(BuildContext context) {
  if (Platform.isAndroid) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Coming Soon!'),
          content: const Text('This feature will be coming soon!'),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                'OK',
                style: TextStyle(color: blackColor),
              ),
              onPressed: () {
                Navigation.back();
              },
            )
          ],
        );
      },
    );
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Coming Soon!'),
            content: const Text('This feature will be coming soon!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigation.back();
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(color: blackColor),
                  ))
            ],
          );
        });
  }
}
