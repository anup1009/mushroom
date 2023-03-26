import 'package:flutter/material.dart';


import 'package:mushroom/myHomepage.dart';
import 'package:mushroom/screens/aboutMushroom.dart';
import 'package:mushroom/screens/aboutUs.dart';
import 'package:mushroom/screens/previousResult.dart';

class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int currentIndex = 0;
  final screens=[
    Center(child: MyHomePage(),),
    Center(child: mushroomInfo(),),
    Center(child: previousResult(),),
    Center(child: aboutUs(),),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( title: Text('Mushroom Classification App'),),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        iconSize: 40,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index)=>setState(() =>currentIndex =index,),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: 'Info'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Previous'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page),label: 'About'),

        ],

      ),
    );
  }
}
