import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    this.fontSize = 12,
    this.isBold = false,
    this.centered = false,
    required this.text,
  }) : super(key: key);

  final double? fontSize;
  final bool isBold;
  final String text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: centered ? TextAlign.center : TextAlign.start);
  }
}
