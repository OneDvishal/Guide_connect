import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideconnect/component/InspectButton.dart';
import 'package:guideconnect/component/timetable.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var _Inspectcolor=#ffffff;
  var _Ison = "-1";

  // get icon => null;
  void _clicked(var str) {
    if (str == _Ison) {
      str = "-1";
    }
    setState(() {
      _Ison = str;
      print(_Ison);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Guide Connect',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Poppins',
              ),
            ),
            actions: [
              DropdownButton(
                // underline: ,
                dropdownColor: Theme.of(context).hoverColor,
                icon: const Icon(Icons.more_vert),
                onChanged: (itemidentifier) {
                  if (itemidentifier == 'Logout') {
                    FirebaseAuth.instance.signOut();
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: 'Logout',
                    child: Container(
                      // color: Color.fromARGB(230, 3, 168, 244),
                      child: Row(
                        children: const [
                          Icon(Icons.exit_to_app),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff757084),
                          ),
                        ),
                        Text(
                          "Vivek Sahu",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff39304E),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Image.network(
                          'https://drive.google.com/file/d/1mPAkuooe8x8b-71mGGejs8BgHJZqhRt5/view?usp=share_link'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TimeTableScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
