// @dart=2.9

import 'package:flutter/material.dart';
import 'package:mushroom/loadingScreen.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mushroom Classification',

      home: LoadingScreen(),
    );
  }
}
