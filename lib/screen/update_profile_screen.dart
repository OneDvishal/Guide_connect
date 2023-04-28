import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guideconnect/component/nevBar.dart';

class UpdateProfileScreen extends StatefulWidget {
  // const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final formkey = GlobalKey<FormState>();
  String? username;
  String? userEmail;
  String? userPic;

  Future<bool> isfinduser(String UserName) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('username', isEqualTo: UserName)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> userdata() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        username = value.data()?['username'];
        userEmail = value.data()?['Email'];
        userPic = value.data()?['profileImageUrl'];
      });
    });
  }

  Future<void> updateprof() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({'Email': userEmail, 'username': username}).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Schedule updated successfully')),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Guide Connect",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular((100.0)),
                      child: userPic != null
                          ? Image(image: NetworkImage(userPic!))
                          : Image(
                              image:
                                  AssetImage("assets/images/profile_pic.png"),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: const Icon(
                        Icons.camera,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: TextEditingController(text: username),
                        decoration: const InputDecoration(
                          label: Text("Username"),
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "please enter username";
                          }
                          bool ispresent = isfinduser(value) as bool;
                          if (ispresent) {
                            return "username is alrady exits";
                          }
                        },
                        onSaved: (newValue) {
                          username = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: TextEditingController(text: userEmail),
                        decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return "please enter valide email";
                          }
                        },
                        onSaved: (newValue) {
                          userEmail = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("password"),
                          prefixIcon: Icon(Icons.fingerprint),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Focus.of(context).unfocus();
                            final isvalid = formkey.currentState?.validate();
                            if (isvalid != null) {
                              formkey.currentState?.save();
                            }
                            updateprof();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Save Changes",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                              child: const Text("LogOut"))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
