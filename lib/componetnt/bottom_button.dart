import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class BottomButton extends StatelessWidget {

  final Function() onTap;
  final String buttonTitle;

  const BottomButton({super.key, required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        child:  Center(
          child: Text(buttonTitle,
            style: kLargeButtonTextFields,
          ),
        ),
      ),
    );
  }
}