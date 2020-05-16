import 'dart:math';
import 'dart:ui';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class BMICalculation {
  // class contructor to pass height and weight for calculation
  BMICalculation({@required this.height, @required this.weight});
  int weight;
  int height;
  double _bmi;

  //private method to calculate bmi
  String _getResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  //private method to return string value
  String _result() {
    if (_bmi < 18.0) {
      return 'underweight';
    } else if (_bmi >= 18 && _bmi < 25) {
      return 'normal';
    } else {
      return 'overweight';
    }
  }

  //private method to return string value
  String _description() {
    if (_bmi < 18.0) {
      return 'You are below average! Please eat more \n and stay healthy';
    } else if (_bmi >= 18.0 && _bmi <= 25.0) {
      return 'Everything is perfect! Keep it up';
    } else {
      return 'You are at risk! Ensure your diet \n and eat properly';
    }
  }

  //Alert dialog to show results and description
  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            title: Text(
              _getResult(),
              style: kNumberStyle,
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Text(
                    _result().toUpperCase(),
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _description(),
                    style: kTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Recalculate',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
