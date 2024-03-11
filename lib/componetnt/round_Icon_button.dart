import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key,  required this.iconData, required this.onPressed});

  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E) ,
      constraints: const BoxConstraints(
          minWidth: 56,
          minHeight: 56

      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}