import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScheduleScreen extends StatefulWidget {
  final String scheduleId;

  const EditScheduleScreen({required this.scheduleId});

  @override
  _EditScheduleScreenState createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  int LecCout=0;
  List<Map<String, String>> lectures = [];
  TextEditingController newLectureNameController = TextEditingController();
  TextEditingController newLectureTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchSchedule();
  }

  void _fetchSchedule() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('schedule')
        .doc(widget.scheduleId)
        .get();

    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null && data is Map<String, dynamic>) {
        final fetchedLectures = data['lectures'] as List<dynamic>;

        lectures = fetchedLectures
            .map((lecture) => {
                  'lecture': lecture['lecture'] as String,
                  'time': lecture['time'] as String,
                })
            .toList();

        setState(() {
          LecCout=lectures.length;
        });
      }
    }
  }

  void _saveSchedule() async {
    final updatedLectures = lectures
        .map((lecture) => {
              'lecture': lecture['lecture'],
              'time': lecture['time'],
            })
        .toList();

    await FirebaseFirestore.instance
        .collection('schedule')
        .doc(widget.scheduleId)
        .update({'lectures': updatedLectures});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Schedule updated successfully')),
    );
  }

  void _addNewSchedule() {
    final newLectureName = newLectureNameController.text;
    final newLectureTime = newLectureTimeController.text;

    setState(() {
      lectures.add({
        'lecture': newLectureName,
        'time': newLectureTime,
      });

      newLectureNameController.clear();
      newLectureTimeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Edit Schedule',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: _saveSchedule,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lectures.length,
              itemBuilder: (context, index) {
                final lectureName = lectures[index]['lecture'];
                final lectureTime = lectures[index]['time'];

                return ListTile(
                  title: TextField(
                    onChanged: (value) {
                      lectures[index]['lecture'] = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Lecture',
                      hintText: 'Enter lecture name',
                    ),
                    controller: TextEditingController(text: lectureName),
                  ),
                  subtitle: TextField(
                    onChanged: (value) {
                      lectures[index]['time'] = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter lecture time',
                    ),
                    controller: TextEditingController(text: lectureTime),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newLectureNameController,
                    decoration: const InputDecoration(
                      labelText: 'New Lecture',
                      hintText: 'Enter lecture name',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: newLectureTimeController,
                    decoration: const InputDecoration(
                      labelText: 'New Time',
                      hintText: 'Enter lecture time',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addNewSchedule,
                  child: const Text('Add Schedule'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

