import '../../index.dart';

class CustomContainer extends StatelessWidget {
  double? width;
  double? height;
  Color? backGroundColor;
  Color? borderColor;
  Widget? child;
  double? borderRadius;
  double? borderWidth;
  AlignmentGeometry? alignment;

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backGroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius??0),
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
      ),
      child: child,
    );
  }
}