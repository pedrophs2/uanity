import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/views/home/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final formGroup = FormGroup({
      'cpf': FormControl<String>(),
      'password': FormControl<String>(),
    });

    bool _validateLogin() {
      bool _cpf = formGroup.control('cpf').value == '12345';
      bool _password = formGroup.control('password').value == 'admin';

      print('$_cpf e $_password');

      if (_cpf && _password) {
        return true;
      }

      print(formGroup.control('cpf').value);
      print(formGroup.control('password').value);
      return false;
    }

    void _login() {
      if (_validateLogin()) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const HomeView();
            },
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('CPF ou senha incorretos'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
            textColor: Colors.blue[300],
          ),
        ),
      );
    }

    return Scaffold(
      body: SizedBox(
        child: ReactiveForm(
          formGroup: formGroup,
          child: SizedBox(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo-lemos.png'),
                  const SizedBox(height: 50),
                  ReactiveTextField(
                    formControlName: 'cpf',
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'password',
                    obscureText: true,
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
      ),
    );
  }
}
