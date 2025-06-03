import 'package:flutter/material.dart';

class Puller extends StatelessWidget {
  const Puller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
    );
  }
}
