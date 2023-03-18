import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://scontent-bom1-2.cdninstagram.com/v/t51.2885-19/327310256_1203631943903472_6312242240879693392_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-bom1-2.cdninstagram.com&_nc_cat=100&_nc_ohc=CqusY-QkWmkAX9MrUZH&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCwEjbl2IIreQ2-ZZXG-e5KGtvg6IcYF60lFcI-YnWPXA&oe=6417710A&_nc_sid=8fd12b'),
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
