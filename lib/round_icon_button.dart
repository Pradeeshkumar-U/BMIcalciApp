// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback onPressed;
  RoundIconButton({required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      constraints: const BoxConstraints.tightFor(width: 56, height: 56.0),
      splashColor: Colors.white24,
      fillColor: const Color.fromARGB(255, 236, 220, 255),
      child: Icon(icon),
    );
  }
}
