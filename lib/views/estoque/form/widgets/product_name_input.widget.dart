import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class ProductNameInputWidget extends StatelessWidget {
  const ProductNameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ArpReactiveInput(
      label: 'Descricao',
      controlName: 'description',
    );
  }
}
