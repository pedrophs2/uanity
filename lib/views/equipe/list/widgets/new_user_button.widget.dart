import 'package:flutter/material.dart';
import 'package:uanity/routes/equipe_routes.dart';

class NewUserButtonWidget extends StatelessWidget {
  const NewUserButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goToForm() {
      Navigator.of(context).pushNamed(EquipeRoutes.usuarioRoute);
    }

    return IconButton(
      onPressed: _goToForm,
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
