import 'package:flutter/material.dart';
import 'package:uanity/dtos/login_dto.dart';
import 'package:uanity/uanity-api/auth/auth_controller.dart';
import 'package:uanity/views/home/home.dart';

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

      var response = await AuthController().login(loginDto.toJson());
      if (response.statusCode == 201) {
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
