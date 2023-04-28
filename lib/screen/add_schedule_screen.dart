import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class createschedule extends StatefulWidget {
  const createschedule({Key? key});

  String? get scheduleId => null;

  @override
  State<createschedule> createState() => _createscheduleState();
}

class _createscheduleState extends State<createschedule> {
  var Leccount = 1;
  List<Map<String, String>> lectures = [];

  void _saveSchedule() async {
    final updatedLectures = lectures
        .map((lecture) => {
              'lecture': lecture['lecture'],
              'time': lecture['time'],
            })
        .toList();

    await FirebaseFirestore.instance
        .collection('schedule')
        .doc()
        .set({'lectures': updatedLectures});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Schedule updated successfully')),
    );
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
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Leccount,
        itemBuilder: (context, index) {
          final lectureName = "";
          final lectureTime = "";

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
            subtitle: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    lectures[index]['time'] = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Time',
                    hintText: 'Enter lecture time',
                  ),
                  controller: TextEditingController(text: lectureTime),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    // Action for the button goes here
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                
              });
            },
          );
        },
      ),
    );
  }
}