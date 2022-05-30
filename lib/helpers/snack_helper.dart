import 'package:flutter/material.dart';

class SnackHelper {
  present(BuildContext context, String message, {String? label = "OK"}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: label!,
          onPressed: () {},
          textColor: Colors.blue[300],
        ),
      ),
    );
  }
}
