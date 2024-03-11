import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/componetnt/ReusableCart.dart';
import 'package:bmi_calculator/componetnt/bottom_button.dart';


class ResultsPage extends StatelessWidget {


  final String bmiResult;
  final String resaultTest;
  final String interpretaion;

  const ResultsPage({super.key, required this.bmiResult, required this.resaultTest, required this.interpretaion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR',
            style: TextStyle(fontSize: 25)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Resault',
              style: kTitleTextStyle,
            ),
          ),),
          Expanded(
             flex: 5,
            child: ReusableCart(
              colour: kActiveCardColour,
              cardChild:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resaultTest.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      interpretaion,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              onPress: () {  },
            ),
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'
          )
        ],
      ),
    );
  }
}
