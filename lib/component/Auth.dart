// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class SignupForm extends StatefulWidget {
  final void Function(String email, String password, bool islogin) submitfm;
  SignupForm(this.submitfm);
  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final _formkey = GlobalKey<FormState>();
  late final String userEmail;
  late final String userPass;
  void trysubmit() {
    FocusScope.of(context).unfocus();
    final isvalid = _formkey.currentState?.validate();
    if (isvalid != null) {
      _formkey.currentState?.save();
    }
    widget.submitfm(userEmail, userPass, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SIGNUP NOW!",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  !value.contains('@') ||
                                  !value.contains('.')) {
                                return "please enter valid email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 0,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                            onSaved: (newValue) =>
                                userEmail = newValue as String,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return "please enter password with more than 8 characters";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                              labelStyle: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 0,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                            onSaved: (newValue) =>
                                userPass = newValue as String,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 8, 4, 113),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Already have an account? Log in here",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
