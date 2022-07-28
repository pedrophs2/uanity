import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/views/login/login.state.dart';
import 'package:uanity/views/login/widgets/cpf_input.widget.dart';
import 'package:uanity/views/login/widgets/login_button.widget.dart';
import 'package:uanity/views/login/widgets/password_input.widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var loginState = LoginState();
    var formGroup = loginState.form;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ReactiveForm(
          formGroup: formGroup,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo-lemos.png'),
              const SizedBox(height: 50),
              const CpfInputWidget(),
              const SizedBox(height: 10),
              const PasswordInputWidget(),
              const SizedBox(height: 20),
              const LoginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
