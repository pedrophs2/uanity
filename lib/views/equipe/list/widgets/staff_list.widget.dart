import 'package:flutter/material.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/shared/arp_list_view.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';
import 'package:uanity/views/equipe/list/widgets/staff_list_item.widget.dart';

class StaffListWidget extends StatefulWidget {
  const StaffListWidget({Key? key}) : super(key: key);

  @override
  State<StaffListWidget> createState() => _StaffListWidgetState();
}

class _StaffListWidgetState extends State<StaffListWidget> {
  List<Usuario> usuarios = [];

  Future<void> _populateUsuarios() async {
    List<Usuario> _usuarios = await UserController().listAll();

    setState(() {
      usuarios = _usuarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _populateUsuarios());

    return ArpListViewWidget(
      items: usuarios,
      itemBuilder: (context, index) {
        return StaffListItemWidget(usuario: usuarios[index]);
      },
    );
  }
}
