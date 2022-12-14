import 'package:flutter/material.dart';
import 'package:preference/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            title: const Text('People'),
            leading: const Icon(Icons.people_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            color: Colors.blue.shade300,
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/menu-img.jpg'))),
        child: const Center(child: Text('Settings')));
  }
}
