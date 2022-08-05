import 'package:flutter/material.dart';

class MenuIconWidget extends StatelessWidget {
  const MenuIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.account_circle,
      color: Colors.white,
      size: 100,
    );
  }
}
