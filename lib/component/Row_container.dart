import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowContainer extends StatelessWidget {
  RowContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      height: 61,
    child: Expanded(
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  width: 151,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(13)),

                  child: Center(
                    child: TextButton(onPressed: () => print("object"),child: Text("Events",
                        style: GoogleFonts.poppins(
                          letterSpacing: 0.6,
                          color: const Color(0xff39304E),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 21),
                        ),),
                  ),
              ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 151,
                decoration: BoxDecoration(
                    color: const Color(0xff5C3DA4),
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                  child: Text("Schedule",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xffFEFEFE),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 21),
                      )),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(13)),
                width: 151,
                height: 61,
                child: Center(
                  child: Text("Assignments",
                      style: GoogleFonts.poppins(
                        letterSpacing: 0.6,
                        color: const Color(0xff39304E),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 21),
                      )),
                ),
              ),
            ),
      ]

          // Container(
          //   decoration: BoxDecoration(
          //       color: const Color(0xffF9F9F9),
          //       borderRadius: BorderRadius.circular(13)),
          //   width: 151,
          //   height: 61,
          //   child: Center(
          //     child: Text("Events",
          //         style: GoogleFonts.poppins(
          //           letterSpacing: 0.6,
          //           color: const Color(0xff39304E),
          //           textStyle: const TextStyle(
          //               fontWeight: FontWeight.w800, fontSize: 21),
          //         )),
          //   ),
          // ),

          ),
    ),
    );
  }
}