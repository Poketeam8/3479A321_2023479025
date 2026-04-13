import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;

  const MineCell({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        border: Border.all(color: theme.colorScheme.outline, width: 1.5),
      ),
      child: Center(
        child: Image.asset('assets/icons/Bomba.png', width: 30, height: 30),
      ),
    );
  }
}
