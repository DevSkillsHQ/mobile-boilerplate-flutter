import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppText extends StatelessWidget {
  AppText({
    Key? key,
    this.fontSize = 12,
    this.isBold = false,
    this.centered = false,
    this.text,
  }) : super(key: key);

  final double? fontSize;
  final bool isBold;
  String? text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return text != ''
        ? Text(text!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: centered ? TextAlign.center : TextAlign.start)
        : SizedBox(
            height: 30,
            width: 200,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Text(
                  'Loading...',
                  textAlign: TextAlign.center,
                )));
  }
}
