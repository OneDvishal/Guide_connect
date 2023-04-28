import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screen/edit_schedule_screen.dart';

class TimeTableScreen extends StatelessWidget {
  // void createLectures() async {
  //   // Create a Firestore instance
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   // Define the lectures for each day
  //   final mondayLectures = [
  //     {
  //       "lecture": "English",
  //       "time": "10:00 AM",
  //     },
  //     {
  //       "lecture": "Math",
  //       "time": "11:00 AM",
  //     },
  //     // Add more lectures for Monday if needed
  //   ];

  //   final tuesdayLectures = [
  //     {
  //       "lecture": "Science",
  //       "time": "9:00 AM",
  //     },
  //     // Add more lectures for Tuesday if needed
  //   ];

  // final saturdayLectures = [
  //   {
  //     "lecture": null,
  //     "time": null,
  //   },
  //   // Add more lectures for Wednesday if needed
  // ];

  //   final thursdayLectures = [
  //     {
  //       "lecture": "OS",
  //       "time": "2:00 PM",
  //     },
  //     // Add more lectures for Thursday if needed
  //   ];

  //   // Create the lectures subcollection for each day
  //   await firestore
  //       .collection('schedule')
  //       .doc('monday')
  //       .set({'lectures': mondayLectures});

  //   await firestore
  //       .collection('schedule')
  //       .doc('tuesday')
  //       .set({'lectures': tuesdayLectures});

  //   await firestore
  //       .collection('schedule')
  //       .doc('wednesday')
  //       .set({'lectures': wednesdayLectures});

  // await firestore
  //     .collection('schedule')
  //     .doc('saturday')
  //     .set({'lectures': saturdayLectures});

  //   print('Lectures created successfully!');
  // }

  @override
  Widget build(BuildContext context) {
    // Call the createLectures function to create the lectures in Firestore
    // createLectures();

    return Expanded(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('schedule')
            .doc(_getDayOfWeek(DateTime.now().weekday))
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for data
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            // Handle any errors that occurred while fetching the data
            return const Center(
              child: Text('Error occurred'),
            );
          }

          final timetableData = snapshot.data?.data();
          if (timetableData == null || timetableData is! Map<String, dynamic>) {
            // Handle the case when the data is null or not in the expected format
            return const Center(
              child: Text('No lectures available for today'),
            );
          }

          final lectures = timetableData['lectures'] as List<dynamic>;
          // if (lectures == null || lectures.isEmpty) {
          //   // Handle the case when there are no lectures for the current day
          //   return const Center(
          //     child: Text('No lectures available for today'),
          //   );
          // }

          return ListView.separated(
            itemCount: lectures.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
            itemBuilder: (BuildContext context, int index) {
              final lecture = lectures[index]['lecture'] as String?;
              final time = lectures[index]['time'] as String?;

              if (lecture == null || time == null) {
                // Handle the case when lecture or time is null
                return const SizedBox.shrink(); // or any other fallback UI
              }

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScheduleScreen(
                            scheduleId: _getDayOfWeek(DateTime.now().weekday)),
                      ),
                    );
                  },
                  title: Text(
                    lecture,
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    time,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case DateTime.monday:
        return 'monday';
      case DateTime.tuesday:
        return 'tuesday';
      case DateTime.wednesday:
        return 'wednesday';
      case DateTime.thursday:
        return 'thursday';
      case DateTime.friday:
        return 'friday';
      case DateTime.saturday:
        return 'saturday';
      case DateTime.sunday:
        return 'sunday';
    }
    throw Exception('Invalid day of week');
  }
}
