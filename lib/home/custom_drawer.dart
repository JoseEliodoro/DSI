import 'package:flutter/material.dart';
import 'package:heal_anality/services/auth_service.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    String currentRouteName = currentRoute?.settings.name ?? "Unknown Route";
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 0) {
          if (currentRouteName != './home' &&
              currentRouteName != './auth') {
            Navigator.of(context).pushNamed('./home');
          }
        } else if (index == 1) {
          if (currentRouteName != './historic' &&
              currentRouteName != './auth') {
            Navigator.of(context).pushNamed('./historic');
          }
        } else if (index == 2) {
          context.read<AuthService>().logout();
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: SizedBox(
            width: 210,
            child: Text('Home'),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.history),
          label: SizedBox(
            width: 210,
            child: Text('Histoty'),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
        ),
      ],
    );
  }
}
