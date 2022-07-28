import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/dtos/login_dto.dart';
import 'package:uanity/helpers/login_helper.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    void _login() async {
      LoginDTO loginDto = LoginDTO(
        cpf: formGroup.value['cpf'].toString(),
        password: formGroup.value['password'].toString(),
      );

      await LoginHelper().login(loginDto, context);
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        child: const Text('Login'),
      ),
    );
  }
}
