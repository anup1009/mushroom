import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
 final String name;
 final String email;


  const StudentCard({Key? key,  required this.name,required this.email,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Image(image: AssetImage('assets/images/${name}.jpg'),width: 150.0,height: 150.0,),
        Text('Name:${name}'),
        Text('Email:${email}'),],
    );;
  }
}


