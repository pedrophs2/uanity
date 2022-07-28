import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_password_input.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArpReactivePasswordInput(
      label: 'Senha',
      controlName: 'password',
    );
  }
}
