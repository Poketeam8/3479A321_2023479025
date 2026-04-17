import 'package:flutter/material.dart';
import 'ui/screens/menu_screen.dart';
import 'ui/screens/history_screen.dart';
import 'ui/screens/minesweeper_screen.dart';
import 'ui/screens/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 116, 75, 37),
          primary: const Color.fromARGB(255, 165, 128, 49),
          secondary: const Color.fromARGB(255, 124, 69, 32),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 78, 43, 62),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      home: const MinesweeperScreen(),
    );
  }
}
