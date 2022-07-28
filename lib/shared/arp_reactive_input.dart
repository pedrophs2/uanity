import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ArpReactiveInput extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final String controlName;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;

  const ArpReactiveInput({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.prefix,
    this.suffix,
    required this.label,
    required this.controlName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: controlName,
      keyboardType: keyboardType,
      readOnly: readOnly,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
