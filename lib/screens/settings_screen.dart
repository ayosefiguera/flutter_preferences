import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:preference/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  int gender = 1;
  String name = 'UserName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                title: const Text('DarkMode'),
                value: isDarkMode,
                onChanged: (value) {
                  isDarkMode = value;
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 1,
                groupValue: gender,
                title: const Text('Male'),
                onChanged: (value) {
                  gender = value ?? 1;
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 2,
                groupValue: gender,
                title: const Text('Female'),
                onChanged: (value) {
                  gender = value ?? 2;
                  setState(() {});
                }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: 'Ayo',
                decoration: const InputDecoration(
                    labelText: 'Name', helperText: 'User Name'),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
