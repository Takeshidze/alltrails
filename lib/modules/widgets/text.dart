import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;

  const MyTextBox(
      {required this.text,
      this.color = Colors.black,
      this.fontSize = 15.0,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
