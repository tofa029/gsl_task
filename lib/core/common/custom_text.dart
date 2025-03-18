import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  TextAlign textAlign;
  int? maxLines;
  TextOverflow overflow;
  FontWeight fontWeight;

  CustomText({
    super.key,
    required this.text,
    this.fontSize = 12.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
