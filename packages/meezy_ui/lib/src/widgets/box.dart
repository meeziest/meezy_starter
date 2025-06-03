import 'package:flutter/material.dart';

class HBox extends SizedBox {
  const HBox(double height, {super.key}) : super(height: height, width: 0);
}

class WBox extends SizedBox {
  const WBox(double width, {super.key}) : super(height: 0, width: width);
}
