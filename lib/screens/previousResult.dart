import 'package:flutter/material.dart';
import 'package:mushroom/navbar.dart';

class previousResult extends StatefulWidget {


  @override
  State<previousResult> createState() => _previousResultState();
}

class _previousResultState extends State<previousResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previous Results'),backgroundColor: Colors.lightBlueAccent,),
      body: Text(''),

    );
  }
}
