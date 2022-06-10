import 'package:flutter/material.dart';

class ArpInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;

  const ArpInput(
      {Key? key,
      required this.label,
      required this.controller,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          enabled: enabled),
    );
  }
}
