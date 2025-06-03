import 'package:flutter/material.dart';

class CircularWhiteIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60)),
        color: Colors.white,
      ),
    );
  }
}
