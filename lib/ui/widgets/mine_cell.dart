import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;

  const MineCell({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[400],
        border: Border.all(
          color: const Color.fromARGB(255, 139, 44, 44),
          width: 1.5,
        ),
      ),
    );
  }
}
