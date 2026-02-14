import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(offset: Offset(2, 2), blurRadius: 3, color: Colors.black26),
        ],
      ),
    );
  }
}
