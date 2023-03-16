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
        padding: const EdgeInsets.only(top: 13.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Guide Connect',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff757084),
                          ),
                        ),
                        Text(
                          "Vivek Sahu",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff39304E),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://scontent-bom1-2.cdninstagram.com/v/t51.2885-19/327310256_1203631943903472_6312242240879693392_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-bom1-2.cdninstagram.com&_nc_cat=100&_nc_ohc=CqusY-QkWmkAX9MrUZH&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCwEjbl2IIreQ2-ZZXG-e5KGtvg6IcYF60lFcI-YnWPXA&oe=6417710A&_nc_sid=8fd12b'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: times.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 16),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            times[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          subtitle: Text(
                            subjects[index],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
