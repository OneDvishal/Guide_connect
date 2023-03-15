import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/Auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  void _submit(
      String email, String password, bool islogin) async {
    UserCredential future;
    try {
      if (!islogin) {
        future = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        future = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // await FirebaseFirestore.instance.collection('User').doc(future.user?.uid).set({
        //   'emailId': email,
        //   'UserId': username,
        // });
      }
    } on PlatformException catch (err) {
      String Massage = "please check credential";
      if (err.message != null) {
        Massage = err.message as String;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Massage),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupForm(_submit),
    );
  }
}
