import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderColumn extends StatelessWidget {
  Icon iconData;
  String myText;
  GenderColumn({super.key, required this.iconData, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconData,
        Text(
          myText,
          style: const TextStyle(
              fontSize: 26,
              fontFamily: 'SignikaNegative-VariableFont_wght.ttf',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        )
      ],
    );
  }
}
