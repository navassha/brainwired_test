import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double width(double width) {
    return MediaQuery.sizeOf(this).width * (width / 430);
  }
}
