import 'package:flutter/material.dart';

import 'package:mushroom/components/information.dart';
class aboutUs extends StatefulWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        child: Column(
          children:[Text('Contact Us:',textAlign: TextAlign.center,textScaleFactor: 3,),
            SingleChildScrollView(

            child: Column(

              children: [ Padding(
                  padding: const EdgeInsets.all(15.0),

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,




                    children: [
                      StudentCard(name: 'Abhisekh Bhandari',email: 'babishek25@gmail.com',),
                      SizedBox(height: 25.0,),
                      // SizedBox(width: 5.0,),
                      StudentCard(name: 'Anup Adhikari',email: 'anupadhikaribct06@gmail.com',),
                      SizedBox(height: 25.0,),
                      StudentCard(name: 'Ichchha Bhattrai',email: 'ichchhababu1234@gmail.com',),
                      SizedBox(height: 25.0,),
                      // SizedBox(width: 5.0,),
                      StudentCard(name: 'Nitesh Pokhrel',email: 'niteshpokhrel2055@gmail.com',),
                    ],
                  )
              ),
              ],




            ),
          ),],
        ),
      ),

    );
  }
}



