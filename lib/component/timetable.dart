import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTableScreen extends StatelessWidget {
  final List<String> times = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '12:00 PM - 1:00 PM',
    '1:00 PM - 2:00 PM',
    '2:00 PM - 3:00 PM',
  ];

  final List<String> subjects = [
    'Analysis Of Algorithm',
    'Operating System',
    'Microprocessor',
    'Database Management SystemP',
    'Python',
    'Engineering Mathematics IV',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:13.0),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Guide Connect",
              style: GoogleFonts.poppins(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.separated(
              itemCount: times.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 16),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8), //padding inbetween container and text
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      subjects[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    subtitle: Text(
                      times[index],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
