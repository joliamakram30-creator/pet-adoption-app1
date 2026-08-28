import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home_screen.dart';


void main() {
  runApp(const PawPrintApp());
}

class PawPrintApp extends StatelessWidget {
  const PawPrintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'PawPrint',

      initialRoute: '/',

      routes: {
        '/': (context) => const HomeScreen(),
      },

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF914D),
          primary: const Color(0xFFFF914D),
          secondary: const Color(0xFFFF3333),
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 57, 38, 27),
          primary: const Color.fromARGB(255, 155, 68, 13),
          secondary: const Color.fromARGB(255, 70, 2, 2),
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.system,
    );
  }
}