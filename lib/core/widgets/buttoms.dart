import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class Buttoms extends StatelessWidget {
  const Buttoms({
    super.key,
    required this.backgroundColor,
    required this.textcolor,
    this.borderRadius,
    required this.text,
  });
  final Color backgroundColor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
        child: Text(
          text,
          style: Styles.textstyle20
              .copyWith(color: textcolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
