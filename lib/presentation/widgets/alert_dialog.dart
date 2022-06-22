import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';

enum DialogAction { confirm, cancel }

class AlertDialogs {
  static Future<DialogAction> confirmCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.cancel),
              child: const Text(
                'Cancel',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.confirm),
              child: const Text(
                'Confirm',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.cancel;
  }
}
