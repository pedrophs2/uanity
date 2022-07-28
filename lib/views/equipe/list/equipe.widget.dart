import 'package:flutter/material.dart';
import 'package:uanity/views/equipe/list/equipe_body.widget.dart';
import 'package:uanity/views/equipe/list/widgets/new_user_button.widget.dart';

class EquipeViewWidget extends StatelessWidget {
  const EquipeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Funcionários'),
        actions: const [
          NewUserButtonWidget(),
        ],
      ),
      body: const EquipeBodyWidget(),
    );
  }
}
