import 'package:flutter/material.dart';
import 'mine_cell.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscaminas')),
      body: SafeArea(
        child: Column(
          children: [
            // STATUS
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
                    children: const [
                      Icon(Icons.grid_on, color: Colors.blue),
                      SizedBox(width: 5),
                      Text('56', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            Expanded(child: _gameBoard()),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64,
            itemBuilder: (context, index) {
              return MineCell(index: index);
            },
          ),
        ),
      ),
    );
  }
}
