import 'dart:math';

import 'package:flutter/material.dart';

import '../models/cell_model.dart';

class GameViewModel extends ChangeNotifier {

  late List<CellModel> _cells;

  List<CellModel> get cells => _cells;

  bool _isGameOver = false;

  bool get isGameOver => _isGameOver;

  GameViewModel() {
    _generateBoard();
  }

  void _generateBoard() {

    _cells = List.generate(
      64,
      (i) => CellModel(index: i),
    );

    Random random = Random();

    int bombsPlanted = 0;

    while (bombsPlanted < 10) {

      int index = random.nextInt(64);

      if (!_cells[index].isBomb) {

        _cells[index].isBomb = true;

        bombsPlanted++;
      }
    }
  }

  void revealCell(int index) {

    if (_isGameOver ||
        _cells[index].isRevealed) {
      return;
    }

    _cells[index].isRevealed = true;

    if (_cells[index].isBomb) {

      _isGameOver = true;

      _revealAll();
    }

    notifyListeners();
  }

  void _revealAll() {

    for (var cell in _cells) {
      cell.isRevealed = true;
    }

  }

  void restartGame() {

    _isGameOver = false;

    _generateBoard();

    notifyListeners();
  }
}