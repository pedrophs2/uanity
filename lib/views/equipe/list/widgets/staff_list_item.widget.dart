import 'package:flutter/material.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/enums/cargo_enum.dart';
import 'package:uanity/routes/equipe_routes.dart';

class StaffListItemWidget extends StatelessWidget {
  final Usuario usuario;

  const StaffListItemWidget({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _openUsuario(Usuario usuario) {
      Navigator.of(context)
          .pushNamed(EquipeRoutes.usuarioRoute, arguments: usuario);
    }

    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () => _openUsuario(usuario),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    usuario.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${cargoLabels[usuario.cargo]}'),
                        const SizedBox(height: 3),
                        Text(usuario.cpf),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.chevron_right_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
