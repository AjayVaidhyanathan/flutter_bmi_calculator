import 'package:flutter/material.dart';
import 'screens/content_main.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: kScaffoldBackground,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          )),
      home: ContentMain(),
    );
  }
}
