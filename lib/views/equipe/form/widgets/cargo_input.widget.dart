import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/enums/cargo_enum.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class CargoInputWidget extends StatefulWidget {
  const CargoInputWidget({Key? key}) : super(key: key);

  @override
  State<CargoInputWidget> createState() => _CargoInputWidgetState();
}

class _CargoInputWidgetState extends State<CargoInputWidget> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> menuItems = [];
    cargoLabels.forEach(
      (key, value) => {
        menuItems.add(
          DropdownMenuItem<int>(
            value: key,
            child: Text(value),
          ),
        ),
      },
    );

    return ReactiveDropdownField(
      formControlName: 'cargo',
      items: menuItems,
      decoration: const InputDecoration(
        label: Text('Cargo'),
        border: OutlineInputBorder(),
      ),
    );
  }
}
