import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

late double prediction;

class CaptureImage extends StatefulWidget {
  @override
  _CaptureImageState createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  String _data = '';
  Color? popUpColor = Colors.grey;
  Color? popUpColorinside = Colors.white;
  String? message = 'Hello';
  bool isLoading = false;
  final picker = ImagePicker();
  File? _imageFile;
  String deviceName = "";

  Future<void> fetchData() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://20.124.164.198/predict'),
    );
    request.files.add(
      await http.MultipartFile.fromPath('file', _imageFile!.path),
    );
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var predictedvalue = (await response.stream.bytesToString());
      print(predictedvalue);
      var responseJSON = await json.decode(predictedvalue);

      var realValue = responseJSON["prediction"];
      prediction = realValue;
      print(realValue);
      if (realValue > 0.7)  {
        //display edible messages
        setState(() {
          popUpColor = Colors.green;
          message = 'Hurray, The mushroom is Edible';
          popUpColorinside = Colors.black;
        });
      } else {
        //display unedible messages
        setState(() {
          popUpColor = Colors.red;
          message = 'Oops! the project is Non Edible';
          popUpColorinside = Colors.white;
        });

        // _showPopUpEdible(context);
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: this.context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: popUpColor,
                title: Text('Edibility Test'),
                content: Text(
                  message!,
                  style: TextStyle(color: popUpColorinside),
                ),
                actions: [
                  TextButton(
                    child: Text('Close', style: TextStyle(color: popUpColorinside)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
      setState(()  {
        _imageFile = File(_imageFile!.path);

        // print(await response.stream.bytesToString());
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void _showPopUpEdible(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: popUpColor,
            title: Text('Edibility Test'),
            content: Text(
              message!,
              style: TextStyle(color: popUpColorinside),
            ),
            actions: [
              TextButton(
                child: Text('Close', style: TextStyle(color: popUpColorinside)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void getDeviceName() async {
    var deviceInfo = await DeviceInfoPlugin().androidInfo;
    deviceName = deviceInfo.model!;
  }

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  Future<void> pickImage() async {
    final clickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (clickedFile != null) {
        _imageFile = File(clickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = _imageFile!.path.split('/').last;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$deviceName/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Image uploaded successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Center(
                child: ListView(
                  children: [
                    TypewriterAnimatedTextKit(
                      text: ['Found a mushroom?'],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _imageFile == null
                        ? Container(
                      child: Icon(
                        Icons.photo,
                        color: Colors.black26,
                        size: MediaQuery.of(context).size.width * .6,
                      ),
                    )
                        : Image.file(
                      _imageFile!,
                      width: 250,
                      height: 400,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          pickImage();
                          tooltip:
                          'Pick Image';
                        },
                        child: Text('Capture an image'),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.orangeAccent),
                            padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                            textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 16))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          //show spinner
                          setState(() {
                            isLoading = true;
                          });

                          await  fetchData();
                          if(prediction>0.7){ uploadImageToFirebase(context);}

                        },
                        child: Text('Check edibility'),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.orangeAccent),
                            padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                            textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 16))),
                      ),
                    ),
                  ],
                )),
            isLoading ? Center(child: CircularProgressIndicator())
                : SizedBox(
              height: 0.0,

            ),
          ],
        ));
  }
}