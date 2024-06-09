import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Calculator extends StatelessWidget {
  VoidCallback myFunc;
  String myText;
  Calculator({
    required this.myText,
    required this.myFunc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: myFunc,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          height: 10.0,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22.0),
              )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text(
                myText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
