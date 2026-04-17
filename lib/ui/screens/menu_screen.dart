import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty': 'Facil', 'gridSize': 8},
              ),
              child: const Text('Jugar Fácil'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty': 'Medio', 'gridSize': 12},
              ),
              child: const Text('Jugar Medio'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty': 'Difícil', 'gridSize': 16},
              ),
              child: const Text('Jugar Difícil'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Ir a Historial'),
            ),
          ],
        ),
      ),
    );
  }
}
