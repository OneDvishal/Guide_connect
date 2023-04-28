
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideconnect/component/Events.dart';
import 'package:guideconnect/component/InspectButton.dart';
import 'package:guideconnect/component/add_admin.dart';
import 'package:guideconnect/component/nevBar.dart';
import 'package:guideconnect/component/timetable.dart';
import 'package:guideconnect/screen/username_photo.dart';
import 'package:guideconnect/screen/week_selection.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _Ison = "Schedule";
  String username = '';
  var profImg;
  String userEmail = '';
  bool showFloatingActionButton = false;
  void _clicked(var str) {
    setState(() {
      _Ison = str;
    });
  }

  Future<void> isAdmin(String Email) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admin')
        .where('AdminMail', isEqualTo: Email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        showFloatingActionButton = true;
      });
    }
    else{
      showFloatingActionButton = false;
    }
  }

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
          userEmail = user['Email'];
        });
      }
    });

    isAdmin(userEmail);
    // print(showFloatingActionButton);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();

    print(_Ison);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
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
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePhoto(),
                  ),
                ),
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: profImg != null && profImg != ''
                      ? NetworkImage(profImg)
                      : Image.asset(
                          'assets/images/profile_pic.png',
                          fit: BoxFit.cover,
                        ).image,
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
                InspectButton("Notifications", _clicked, _Ison),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (_Ison == "Schedule") TimeTableScreen(),
          if (_Ison == "Event") Eventscreen(),
        ]),
      ),
      floatingActionButton: showFloatingActionButton
          ? FloatingActionButton(
              // focusColor: Colors.black,
              backgroundColor: Colors.black,
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddAdmin(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.person_2_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeekdaySelectionScreen(),
                                  ));
                            },
                            icon: const Icon(Icons.event),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: nevBar(),
      ),
    );
  }
}
