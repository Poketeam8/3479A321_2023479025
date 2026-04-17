import 'package:flutter/material.dart';
import '../../models/game_result.dart';
import '../widgets/game_result_ui.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GameResult> listMaqueta = [
      GameResult(
        date: '10 Abr',
        timeSpent: '01:20',
        isVictory: true,
        difficulty: 'Fácil',
      ),
      GameResult(
        date: '09 Abr',
        timeSpent: '04:45',
        isVictory: false,
        difficulty: 'Difícil',
      ),
      GameResult(
        date: '08 Abr',
        timeSpent: '02:10',
        isVictory: true,
        difficulty: 'Medio',
      ),
      GameResult(
        date: '07 Abr',
        timeSpent: '03:30',
        isVictory: false,
        difficulty: 'Fácil',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Historial')),

      body: ListView.builder(
        itemCount: listMaqueta.length,
        itemBuilder: (context, index) {
          final game = listMaqueta[index];

          return GameResultUI(game: game);
        },
      ),
    );
  }
}
