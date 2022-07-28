import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class ProductLabelInput extends StatelessWidget {
  const ProductLabelInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArpReactiveInput(label: 'Fabricante', controlName: 'label');
  }
}
