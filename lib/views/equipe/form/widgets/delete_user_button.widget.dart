import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uanity/helpers/snack_helper.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';

class DeleteUserButtonWidget extends StatelessWidget {
  final int userId;

  const DeleteUserButtonWidget({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deleteUser() async {
      Response response = await UserController().deleteUser(userId);

      if (response.statusCode == 200) {
        SnackHelper().present(context, 'Usuário excluído com sucesso');
        Navigator.of(context).pop();
      }
    }

    if (userId >= 0) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: deleteUser,
          child: const Text('Excluir'),
        ),
      );
    } else {
      return Container();
    }
  }
}
