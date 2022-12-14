import 'package:flutter/material.dart';
import 'package:preference/share_preference/preferences.dart';
import 'package:preference/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode:${Prefereces.isDarkMode}'),
            const Divider(),
            Text('Gender:${Prefereces.gender == 1 ? 'Male' : 'Female'}'),
            const Divider(),
            Text('Name: ${Prefereces.name}'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
