import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Lectures extends StatelessWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 12, right: 26),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xff5C3DA4),
                borderRadius: BorderRadius.circular(26)),
            width: 353,
            height: 91,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //lecture 1
                Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: Text("Analysis of Algorithm",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xffFFFFFF),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 21),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 5),
                  child: Text("9:30 am - 10:30 am",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xffFFFFFF),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      )),
                ),
              ],
            ),
          ),
        ),

        //lecture 2
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 26, right: 26),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE7E7E7)),
                borderRadius: BorderRadius.circular(26)),
            width: 353,
            height: 91,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: Text("Operating System",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xff160A2E),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 21),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 5),
                  child: Text("10:30 am - 11:30 am",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xff9F9AA8),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      )),
                ),
              ],
            ),
          ),
        ),

        //lecture 3
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 26, right: 26),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE7E7E7)),
                borderRadius: BorderRadius.circular(26)),
            width: 353,
            height: 91,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0),
                  child: Text("Microprocessor",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xff160A2E),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 21),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 5),
                  child: Text("11:30 am - 12:30 am",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xff9F9AA8),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}