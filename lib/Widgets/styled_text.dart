import 'package:brain_wired_mechine_test/extensions/responsive.dart';
import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    this.color,
    this.fontWeight,
    required this.text,
    required this.size,
  });
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: context.width(size),
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
