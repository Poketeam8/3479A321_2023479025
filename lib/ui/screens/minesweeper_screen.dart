import 'package:flutter/material.dart';
import '../widgets/mine_cell.dart';
import 'about.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String difficulty = args?['difficulty'] ?? 'Desconocida';
    final int gridSize = args?['gridSize'] ?? 8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
        actions: [
          IconButton(
            tooltip: 'Historial',
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          IconButton(
            tooltip: 'Acerca de',
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              color: const Color.fromARGB(255, 209, 119, 119),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.timer, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        '349s',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 5),
                      Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.grid_on, color: Colors.blue),
                      const SizedBox(width: 5),
                      Text(
                        '${gridSize * gridSize}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              'Dificultad: $difficulty',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Tamaño: $gridSize x $gridSize',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const Divider(height: 1),

            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridSize,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                      ),
                      itemCount: gridSize * gridSize,
                      itemBuilder: (context, index) {
                        return MineCell(index: index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
