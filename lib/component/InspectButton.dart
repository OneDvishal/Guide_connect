import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InspectButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String InspectName, Ison;
  final Function clicked;
  // const Profile._Str=InspectName;

  // final String ButtonColour ="0xffF9F9F9";
  const InspectButton(this.InspectName, this.clicked, this.Ison);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 61,
        // width: double.infinity,
        margin: const EdgeInsets.only(top: 45),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 156,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Ison == InspectName
                  ? Colors.black
                  : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  clicked(InspectName);
                },
                child: Text(
                  InspectName,
                  style: GoogleFonts.poppins(
                    letterSpacing: 0.6,
                    color: Ison == InspectName
                        ? Theme.of(context).scaffoldBackgroundColor
                        : const Color(0xff39304E),
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
