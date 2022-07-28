import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class NomeInputWidget extends StatelessWidget {
  const NomeInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArpReactiveInput(label: 'Nome', controlName: 'nome');
  }
}
