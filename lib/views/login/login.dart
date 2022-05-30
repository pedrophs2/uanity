import 'package:flutter/material.dart';
import 'package:uanity/dtos/login_dto.dart';
import 'package:uanity/helpers/login_helper.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cpfController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void _login() async {
      LoginDTO loginDto = LoginDTO(
        cpf: cpfController.text,
        password: passwordController.text,
      );

      await LoginHelper().login(loginDto, context);
    }

    return Scaffold(
      body: SizedBox(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo-lemos.png'),
                const SizedBox(height: 50),
                TextField(
                  controller: cpfController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
