import 'dart:ui';

import 'package:flutter/material.dart';

class FocusedMessageScreen extends StatelessWidget {
  final Widget child;

  const FocusedMessageScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Полупрозрачный фон
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Размытие только сверху, ограниченное определенной высотой
          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  // the size where the blurring starts
                  height: 500,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          // Виджет child внизу без размытия
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: SizedBox(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
