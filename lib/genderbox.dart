import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderBox extends StatefulWidget {
  Color colour;
  Widget myReturn;
  double genderType;

  GenderBox(this.colour, this.myReturn, this.genderType, {super.key});

  @override
  State<GenderBox> createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {
  Container cardType() {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.all(widget.genderType),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: widget.colour,
      ),
      child: widget.myReturn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return cardType();
  }
}
