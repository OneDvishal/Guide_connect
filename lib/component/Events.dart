// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Events is not build yet you mother f*cker",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              letterSpacing: 0.6,
              color: const Color(0xff39304E),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 31),
            ));
  }
}