import 'package:flutter/material.dart';
import 'package:preference/provider/theme_provider.dart';
import 'package:preference/screens/screens.dart';
import 'package:preference/share_preference/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  //Preferences.init return a future object, we need use async [main].
  //we need the binding to be initialized before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();
  await Prefereces.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkmode: Prefereces.isDarkMode),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User preference',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen(),
      },
    );
  }
}
