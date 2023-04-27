import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideconnect/component/InspectButton.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:guideconnect/component/nevBar.dart';
import 'package:guideconnect/component/timetable.dart';
import 'package:guideconnect/screen/username_photo.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var _Inspectcolor=#ffffff;
  var _Ison = "Schedule";
  // var _page=0;

  // get icon => null;
  void _clicked(var str) {
    setState(() {
      _Ison = str;
    });
  }

  String username = '';
  var profImg;
  Future getData() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) async {
      final user = value;
      if (value.exists) {
        setState(() {
          username = user['username'];
          profImg = user['profileImageUrl'];
        });
        print("geting");
      }
    });

    print(username);
  }

  @override
  void initState() {
    getData();
    super.initState();
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
                            style: TextStyle(color: Colors.black),
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
            padding: const EdgeInsets.all(16),
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
                            color: const Color(0xff757084),
                          ),
                        ),
                        Text(
                          username != null ? username : "",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff39304E),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      // onTap: Navigator.push(context, route),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePhoto())),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(profImg!=null?profImg: 
                            'https://i.pinimg.com/originals/17/66/56/1766569ede614813665828719d0872e6.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InspectButton("Schedule", _clicked, _Ison),
                      InspectButton("Event", _clicked, _Ison),
                      InspectButton("Assingment", _clicked, _Ison),
                      // InspectButton("Event", _clicked, _Ison),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_Ison == "Schedule") TimeTableScreen(),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 60,
            child: nevBar(),
          ),
        ),
      ),
    );
  }
}
