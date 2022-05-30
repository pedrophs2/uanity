import 'package:flutter/material.dart';
import 'package:uanity/routes/app_routes.dart';
import 'package:uanity/views/equipe/equipe.dart';
import 'package:uanity/views/estoque/estoque.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _logout() {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }

    void _goTo(String route) {
      // Navigator.pop(context);
      Navigator.of(context).pushNamed(route);
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
            onTap: () => _goTo(AppRoutes.estoque),
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
            onTap: () => _goTo(AppRoutes.equipe),
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
