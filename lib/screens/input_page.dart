import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/componetnt/ReusableCart.dart';
import 'package:bmi_calculator/componetnt/IconContent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens//resaults_page.dart';
import 'package:bmi_calculator/componetnt/bottom_button.dart';
import 'package:bmi_calculator/componetnt/round_Icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female,
  unknown,
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.unknown;
  int height = 180;
  int weight = 60;
  int age = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR',
        style: TextStyle(fontSize: 25),),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCart(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveCardColour ,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
              ),),
              Expanded(child: ReusableCart(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
              )),
            ],
          )),
          Expanded(child: ReusableCart(
            onPress: (){
            },
            cardChild:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                        'cm',
                        style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.pink,
                    inactiveColor: CupertinoColors.inactiveGray,
                    onChanged: (double newValue){
                      setState(() {
                        setState(() {
                          height = newValue.toInt();
                        });
                        });
                      },
                )
              ],
            ),
            colour: kActiveCardColour,
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCart(
                onPress: (){

                },
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          iconData: FontAwesomeIcons.minus,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          iconData: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(child: ReusableCart(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          iconData: FontAwesomeIcons.minus,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          iconData: FontAwesomeIcons.plus,
                        )
                      ],
                    )
                  ],
                ),
                onPress: (){

                },
                colour: kActiveCardColour,
              )),
            ],
          )),
          BottomButton(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height, weight);


              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resaultTest: calc.getResult(),
                interpretaion: calc.getInterpretation(),
              )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}



