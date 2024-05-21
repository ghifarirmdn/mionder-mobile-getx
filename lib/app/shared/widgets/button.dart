import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onTap,
    this.color,
    this.child,
    this.paddingContent,
    this.borderRadius,
  });
  final Function()? onTap;
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? paddingContent;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Padding(
            padding: paddingContent ?? const EdgeInsets.symmetric(vertical: 15),
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
