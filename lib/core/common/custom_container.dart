import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  double? width;
  double? height;
  Color? backGroundColor;
  Color? borderColor;
  Widget? child;
  double? borderRadius;
  double? borderWidth;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;

  CustomContainer({
    super.key,
     this.width,
     this.height,
     this.backGroundColor,
     this.borderColor,
     this.child,
    this.borderRadius,
    this.borderWidth,
    this.alignment,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backGroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius??0),
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
      ),
      child: child,
    );
  }
}