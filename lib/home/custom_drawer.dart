import 'package:flutter/material.dart';
import 'package:heal_anality/services/auth_service.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    String currentRouteName = currentRoute?.settings.name ?? "Unknown Route";
    int getIndex({bool i = false}) {
      
      if (currentRouteName == './home' || currentRouteName == './auth') {
        return 0;
      } else if (currentRouteName == './historic') {
        return 1;
      } else if (currentRouteName == './add_pacient' || currentRouteName == './put_pacient') {
        return 2;
      }else if (currentRouteName == './read_pacient') {
        return 3;
      }
      return 4;
    }

    return NavigationDrawer(
      selectedIndex: getIndex(),
      onDestinationSelected: (index) {
        if (index == 0) {
          if (currentRouteName != './home' || currentRouteName == './auth') {
            Navigator.of(context).pushNamed('./home');
          }
        } else if (index == 1) {
          if (currentRouteName != './historic' ||
              currentRouteName == './auth') {
            Navigator.of(context).pushNamed('./historic');
          }
        } else if (index == 2) {
          if (currentRouteName != './add_pacient') {
            Navigator.of(context).pushNamed('./add_pacient');
          }
        } else if (index == 3) {
          if (currentRouteName != './read_pacient') {
            Navigator.of(context).pushNamed('./read_pacient');
          }
        } else if (index == 4) {
          context.read<AuthService>().logout();
          Navigator.of(context).pushNamed('./auth');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Options',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: SizedBox(
            width: 210,
            child: Text('Predict'),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.history),
          label: SizedBox(
            width: 210,
            child: Text('Historic Predicts'),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person_add_alt_sharp),
          label: SizedBox(
            width: 210,
            child: Text('Add Pacient'),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person_search_sharp),
          label: SizedBox(
            width: 210,
            child: Text('Read Pacient'),
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
