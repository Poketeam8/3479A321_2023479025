import 'package:flutter/material.dart';
import '../../models/game_result.dart';

class GameResultUI extends StatelessWidget {
  final GameResult game;

  const GameResultUI({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text('Fecha: ${game.date}'),
        subtitle: Text(
          'Tiempo: ${game.timeSpent} | Dificultad: ${game.difficulty}',
        ),
        trailing: Icon(
          game.isVictory ? Icons.check : Icons.close,
          color: game.isVictory ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
