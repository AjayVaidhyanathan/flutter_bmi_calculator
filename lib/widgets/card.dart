import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  CardTile({this.color: kCardColor, this.margin, this.child});
  final Color color;
  final EdgeInsets margin;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: child,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: kBorderRadius,
      ),
    );
  }
}
