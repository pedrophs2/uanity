import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class CpfInputWidget extends StatelessWidget {
  const CpfInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArpReactiveInput(
      label: 'CPF',
      controlName: 'cpf',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
