import 'dart:io';

import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCart.dart';
import 'IconContent.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xfffeb1555);
const inActiveCardColour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  void updateColour(Gender gender){
    if(gender == Gender.male){
      maleCardColour = activeCardColour;
      femaleCardColour = inActiveCardColour;
    }else if(gender == Gender.female){
      maleCardColour = inActiveCardColour;
      femaleCardColour = activeCardColour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR',
        style: TextStyle(fontSize: 25),),
      ),
      body:  Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(Gender.male);
                  });
                },
                child: ReusableCart(
                  colour: maleCardColour ,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
              ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(Gender.female);
                  });
                },
                child: ReusableCart(
                  colour: femaleCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              )),
            ],
          )),
          Expanded(child: ReusableCart(
            colour: activeCardColour,
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCart(
                colour: activeCardColour,
              )),
              Expanded(child: ReusableCart(
                colour: activeCardColour,
              )),
            ],
          )),
          Container(
            color: bottomContainerColour,
            margin: const EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
