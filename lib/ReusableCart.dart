import 'package:flutter/material.dart';


class ReusableCart extends StatelessWidget {
  ReusableCart({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      child: cardChild,
    );
  }
}