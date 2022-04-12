import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

    String cpf = '';
    String password = '';

    void _updateData() {
      print(formGroup.value);
      print(formGroup.control('cpf').value);
      print(formGroup.control('password').value);
      setState(() {
        cpf = formGroup.control('cpf').value;
        password = formGroup.control('password').value;
      });
      print(cpf);
      print(password);
    }

    return SizedBox(
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
                    onPressed: _updateData,
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
