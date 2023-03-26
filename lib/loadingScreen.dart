
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mushroom/myHomepage.dart';
import 'package:mushroom/navbar.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (ctx)=> navBar()));

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(

        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: const [

            Image(image: AssetImage('assets/images/appicon.png')),
            Text('Mushroom Classification App',textScaleFactor: 2.0,),
            SizedBox(height: 50,),
            SpinKitFadingCircle(
              color: Colors.orange,
              size: 50.0,
            )
          ],



        ),
      ),
      backgroundColor: Colors.tealAccent,
    );
  }
}

