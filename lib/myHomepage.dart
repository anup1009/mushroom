import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  chooseImages() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery,);
    if (image != null) {
      setState(() {
        _image = File(image.path,);
      });
    }
  }

  captureImages() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera,);
    if (image != null) {
      setState(() {
        _image = File(image.path,);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          TypewriterAnimatedTextKit(
            text: [' Lets get started'],
            textStyle: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _image != null
              ? Container(
            child: Image.file(_image!),
          )
              : Container(
            child: Icon(
              Icons.photo,
              color: Colors.blue,
              size: MediaQuery
                  .of(context)
                  .size
                  .width * .6,
            ),
          ),
          // ButtonDesign(text:'data',onPressed:(){},),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                captureImages();
              },
              child: Text('Capture an image'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 16))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                chooseImages();
              },
              child: Text('Select From Gallery'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 16))),
            ),
          ),

        ],
      ),

      backgroundColor: Colors.white60,

    );
  }
}



