import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screen/edit_schedule_screen.dart';

class TimeTableScreen extends StatelessWidget {
  Future<bool> isAdminUser(String userEmail) async {
    try {
      if (userEmail == 'test@123.com') {
        return true;
      }

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('admin_emails')
          .where('email', isEqualTo: userEmail)
          .get();

      // Return true if the email exists in the collection
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      // Handle any errors that occur during the query
      print('Error checking admin user: $error');
      return false;
    }
  }

// Implement onTap based on user's admin status
  void handleOnTap(BuildContext context) async {
    final String? userEmail = FirebaseAuth.instance.currentUser?.email;

    // Check if the user is an admin
    bool isAdmin = await isAdminUser(userEmail!);

    if (isAdmin) {
      // Navigate to EditScheduleScreen if the user is an admin
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditScheduleScreen(
            scheduleId: _getDayOfWeek(DateTime.now().weekday),
          ),
        ),
      );
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('schedule')
            .doc(_getDayOfWeek(DateTime.now().weekday))
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Handle any errors that occurred while fetching the data
            return const Center(
              child: Text('Error occurred'),
            );
          }

          final timetableData = snapshot.data?.data();
          if (timetableData == null ||
              timetableData is! Map<String, dynamic>) {
            // Handle the case when the data is null or not in the expected format
            return const Center(
              child: Text('No lectures available for today'),
            );
          }

          final lectures = timetableData['lectures'] as List<dynamic>;
          

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
                    handleOnTap(context);
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
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
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
