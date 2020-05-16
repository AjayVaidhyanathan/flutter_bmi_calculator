import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {this.elevation: 1.5,
      @required this.icon,
      @required this.onPress,
      this.color: Colors.white});

  final Color color;
  final Icon icon;
  final Function onPress;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onPress,
      elevation: elevation,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
