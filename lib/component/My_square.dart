import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySquare extends StatelessWidget {
  final String child;
  MySquare({required this.child});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        color: const Color(0xffF9F9F9),
        child: Text(child,
            style: GoogleFonts.poppins(
              letterSpacing: 0.6,
              color: const Color(0xff39304E),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 31),
            )),
      ),
    );
  }
}