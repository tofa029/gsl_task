import 'package:flutter/material.dart';

/// A custom text view which extends stateless widget
/// This widget provides a text which can be easily used by using simple params
/// It is wrapped inside a [Text] to ensure a native text behaviour
class CustomText extends StatelessWidget {
  ///used for text to show in view as required param
  String text;

  ///all below are optional params if not given then will take the default given
  ///
  /// used for text customized fontsize
  double fontSize;

  /// used for customized text color default color black
  Color color;

  /// used for customized text textalign default start
  TextAlign textAlign;

  /// used for customized text maxline default null
  int? maxLines;

  /// used for customized text overflow default chose to elipsis
  TextOverflow overflow;

  /// used for customized text weight default chose to normal
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
