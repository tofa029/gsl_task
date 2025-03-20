import 'package:flutter/material.dart';

/// A custom container which extends stateless widget
/// This widget provides a container which can be easily used by using simple params
/// It is wrapped inside a [Container] to ensure a container behaviour
class CustomContainer extends StatelessWidget {
  ///used for container custom width and height as optional param
  ///all params if null it will behave as a basic container
  double? width;
  double? height;

  ///used for container background color as optional param
  Color? backGroundColor;

  ///used for designing custom widgets inside it
  Widget? child;

  ///used for container customized width and height as optional param
  Color? borderColor;
  double? borderRadius;
  double? borderWidth;

  ///used for container customized alignment, poadding, margin
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