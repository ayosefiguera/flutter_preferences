import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:preference/provider/theme_provider.dart';
import 'package:preference/share_preference/preferences.dart';
import 'package:preference/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                value: Prefereces.isDarkMode,
                onChanged: (value) {
                  Prefereces.isDarkMode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarktMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 1,
                groupValue: Prefereces.gender,
                title: const Text('Male'),
                onChanged: (value) {
                  Prefereces.gender = value ?? 1;
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                value: 2,
                groupValue: Prefereces.gender,
                title: const Text('Female'),
                onChanged: (value) {
                  Prefereces.gender = value ?? 2;
                  setState(() {});
                }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Prefereces.name,
                decoration: const InputDecoration(
                    labelText: 'Name', helperText: 'User Name'),
                onChanged: (value) {
                  Prefereces.name = value;
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
