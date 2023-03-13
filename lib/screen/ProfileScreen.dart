import 'dart:developer';

import 'package:flutter/material.dart';

import '../component/Display.dart';
import '../component/Hello_Name.dart';
import '../component/InspectButton.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var _Inspectcolor=#ffffff;
    var _Ison="-1";
    
      // get icon => null;
  void _clicked(var  str){
    if(str==_Ison){
      str="-1";
    }
    setState(() {
      _Ison=str;
      print(_Ison);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column(children: [
          const HelloName(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child : Row(
                    children: [
                      InspectButton("Events", _clicked,_Ison),
                      InspectButton("Schedule",_clicked,_Ison),
                      InspectButton("Assignments",_clicked,_Ison),
                      InspectButton("Events",_clicked,_Ison),
                    ],
                  ),
                  
              ),
          Display(_Ison),
        ]),
        bottomNavigationBar: NavigationBar(destinations: [
           IconButton(onPressed: () {print("kyu dabaya re madar chod");}, icon: Icon(Icons.home)),
        ]),
        ),
    );
  }
}