import 'package:flutter/material.dart';
import 'package:uanity/shared/arp_reactive_input.dart';

class CpfInputWidget extends StatelessWidget {
  const CpfInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArpReactiveInput(
      label: 'CPF',
      controlName: 'cpf',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validationMessages: (control) => {
        'required': 'O CPF não pode ser vazio',
        'minLength': 'O CPF deve ter no mínimo 11 caracteres'
      },
    );
  }
}
