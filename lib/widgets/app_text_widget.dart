import 'package:flutter/material.dart';

class AppTextWidgets extends StatelessWidget {
  final String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  AppTextWidgets({
    required this.text,
    this.color,
    this.fontWeight,
    super.key, required int fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
