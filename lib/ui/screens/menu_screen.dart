import 'package:flutter/material.dart';

import '../../core/services/storage_service.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {

    final username =
        StorageService.getUsername();

    final difficulty =
        StorageService.getDifficulty();

    int gridSize;

    switch (difficulty) {

      case 'Medio':
        gridSize = 12;
        break;

      case 'Difícil':
        gridSize = 16;
        break;

      default:
        gridSize = 8;
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text('Menú Principal'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Text(
              'Bienvenido $username',

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Dificultad actual: $difficulty',

              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(

                context,
                '/game',

                arguments: {
                  'difficulty': difficulty,
                  'gridSize': gridSize,
                },
              ),

              child: const Text('Jugar'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(
                    context,
                    '/history',
                  ),

              child: const Text('Ir a Historial'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(

              onPressed: () async {

                await Navigator.pushNamed(
                  context,
                  '/settings',
                );

                setState(() {});
              },

              child: const Text('Ajustes'),
            ),
          ],
        ),
      ),
    );
  }
}