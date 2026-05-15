import 'package:flutter/material.dart';

import '../../models/cell_model.dart';

class MineCell extends StatelessWidget {

  final CellModel cell;
  final VoidCallback onTap;

  const MineCell({
    super.key,
    required this.cell,
    required this.onTap,
  });

  Widget _buildCellContent() {

    if (!cell.isRevealed) {
      return const SizedBox.shrink();
    }

    if (cell.isBomb) {

      return Image.asset(
        'assets/icons/Bomba.png',
        width: 30,
        height: 30,
        fit: BoxFit.contain,
      );
    }

    return Text(
      '${cell.index}',

      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 199, 43, 43),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return GestureDetector(

      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(

          color: cell.isRevealed
              ? const Color.fromARGB(255, 18, 2, 248)
              : theme.colorScheme.secondary,

          border: Border.all(
            color: theme.colorScheme.outline,
            width: 1.5,
          ),
        ),

        child: Center(
          child: _buildCellContent(),
        ),
      ),
    );
  }
}