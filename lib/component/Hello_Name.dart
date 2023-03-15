
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloName extends StatelessWidget {
  const HelloName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            
            //Hello
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text("One_direction_vishal",
                  style: GoogleFonts.poppins(
                    letterSpacing: 0.6,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 28),
                  )),
            ),


            //Name
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text("Vivek Sahu",
                  style: GoogleFonts.poppins(
                    letterSpacing: 0.6,
                    color: const Color(0xff39304E),
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 22),
                  )),
            ),
          ],
        ),



        //for profile image
        Padding(
          padding: const EdgeInsets.only(right: 26.0, top: 100),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: const Color.fromARGB(255, 132, 78, 224)),
            child: Image.asset(
              'assets/logo/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}