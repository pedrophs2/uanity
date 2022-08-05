import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uanity/entities/usuario.dart';

class MenuUserNameWidget extends StatelessWidget {
  const MenuUserNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const storage = FlutterSecureStorage();
    // var user = Usuario.fromJson(storage.read(key: 'user'));

    return Container();
  }
}
