import 'dart:ui';
import 'package:bmi_calculator/model/calculation.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentMain extends StatefulWidget {
  @override
  _ContentMainState createState() => _ContentMainState();
}

class _ContentMainState extends State<ContentMain> {
  bool isSwitched = false;
  int height = 160;
  int age = 20;
  int weight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kMenuIcon,
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: kAppBarStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardTile(
                    margin:
                        EdgeInsets.only(left: 15, top: 15, bottom: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Age",
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Color(0xFF586EE8),
                                ),
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            RoundIconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xFF586EE8),
                                ),
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardTile(
                    margin:
                        EdgeInsets.only(left: 5, top: 15, bottom: 5, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Weight (kg) ",
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Color(0xFF586EE8),
                                ),
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            RoundIconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Color(0xFF586EE8),
                                ),
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardTile(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Height (cm) ",
                    style: kTextStyle,
                  ),
                  Text(
                    height.toString(),
                    style: kNumberStyle,
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Color(0x80565769),
                      thumbColor: Colors.blueAccent,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 300.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CardTile(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Male",
                    style: kTextStyle,
                  ),
                  Switch(
                      activeTrackColor: Colors.pink,
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.blue,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      }),
                  Text(
                    "Female",
                    style: kTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CALCULATE',
                  style: kTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                CardTile(
                  child: RoundIconButton(
                      elevation: 5.0,
                      color: Colors.blue,
                      icon: Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.white,
                      ),
                      onPress: () {
                        setState(() {
                          BMICalculation bmiCalculation = new BMICalculation(
                              height: height, weight: weight);
                          bmiCalculation.buildShowDialog(context);
                        });
                      }),
                  color: kScaffoldBackground,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Made by AJ ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
