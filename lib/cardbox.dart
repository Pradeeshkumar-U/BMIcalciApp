// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CardBox extends StatefulWidget {
  Color colour;
  Widget myReturn;

  CardBox(this.colour, this.myReturn, {super.key});

  @override
  State<CardBox> createState() => _CardBoxState();
}

class _CardBoxState extends State<CardBox> {
  Container cardType() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
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
