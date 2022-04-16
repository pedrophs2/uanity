import 'package:flutter/material.dart';
import 'package:uanity/views/equipe/equipe.dart';
import 'package:uanity/views/estoque/estoque.dart';
import 'package:uanity/views/login.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _logout() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return const LoginView();
          },
        ),
      );
    }

    void _goTo(Widget destination) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return destination;
          },
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Valesca Lima',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () => _goTo(const EstoqueView()),
            textColor: Theme.of(context).primaryColor,
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.shopping_basket_rounded),
            title: const Text('Estoque'),
          ),
          ListTile(
            onTap: () {},
            textColor: Theme.of(context).primaryColor,
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.history),
            title: const Text('Histórico de Uso'),
          ),
          ListTile(
            onTap: () => _goTo(const EquipeView()),
            textColor: Theme.of(context).primaryColor,
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.people),
            title: const Text('Equipe'),
          ),
          ListTile(
            onTap: _logout,
            iconColor: Colors.red,
            textColor: Colors.red,
            leading: const Icon(
              Icons.power_settings_new,
            ),
            title: const Text(
              'Sair',
            ),
          )
        ],
      ),
    );
  }
}
