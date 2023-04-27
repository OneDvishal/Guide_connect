import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideconnect/component/InspectButton.dart';
import 'package:guideconnect/component/nevBar.dart';
import 'package:guideconnect/component/timetable.dart';
import 'package:guideconnect/screen/username_photo.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _Ison = "Schedule";
  String username = '';
  var profImg;
  String? userEmail;

  @override
  void initState() {
    getData();
    super.initState();
    getUserEmail();
  }

  

  Future<void> getData() async {
    final userDoc = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid);

    final userSnapshot = await userDoc.get();

    if (userSnapshot.exists) {
      setState(() {
        username = userSnapshot.get('username');
        profImg = userSnapshot.get('profileImageUrl');
      });
    }
  }

  void _clicked(var str) {
    setState(() {
      _Ison = str;
    });
  }

  Future<void> getUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    bool showFloatingActionButton =
        FirebaseAuth.instance.currentUser?.email == 'test@123.com';

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
          actions: [
            DropdownButton(
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
      ),
      body: Container(
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
                        : const NetworkImage(
                            'https://i.pinimg.com/originals/17/66/56/1766569ede614813665828719d0872e6.jpg',
                          ),
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
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (_Ison == "Schedule") TimeTableScreen(),
          ],
        ),
      ),
      floatingActionButton: showFloatingActionButton
          ? FloatingActionButton(
              onPressed: () {
                // Handle the onPressed event
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
