import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ArpReactivePasswordInput extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final String controlName;
  final bool enabled;
  final ValidationMessagesFunction<dynamic>? validationMessages;

  const ArpReactivePasswordInput({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.validationMessages,
    required this.label,
    required this.controlName,
  }) : super(key: key);

  @override
  State<ArpReactivePasswordInput> createState() =>
      _ArpReactivePasswordInputState();
}

class _ArpReactivePasswordInputState extends State<ArpReactivePasswordInput> {
  bool isHidden = true;
  Map<bool, IconData> icons = {
    true: Icons.visibility,
    false: Icons.visibility_off
  };

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: widget.controlName,
      keyboardType: widget.keyboardType,
      obscureText: isHidden,
      validationMessages: widget.validationMessages,
      decoration: InputDecoration(
        label: Text(widget.label),
        border: const OutlineInputBorder(),
        enabled: widget.enabled,
        suffixIcon: IconButton(
          icon: Icon(icons[isHidden]),
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
        ),
      ),
    );
  }
}
