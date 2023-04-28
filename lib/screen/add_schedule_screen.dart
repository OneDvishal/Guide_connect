import 'package:flutter/material.dart';

class createschedule extends StatefulWidget {
  const createschedule({super.key});

  @override
  State<createschedule> createState() => _createscheduleState();
}

class _createscheduleState extends State<createschedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Edit Schedule', style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          final lectureName = "lectures[index]['lecture'];";
          final lectureTime = "lectures[index]['time']";

          return ListTile(
            title: TextField(
              onChanged: (value) {
                "lectures[index]['lecture'] = value";
              },
              decoration: const InputDecoration(
                labelText: 'Lecture',
                hintText: 'Enter lecture name',
              ),
              controller: TextEditingController(text: lectureName),
            ),
            subtitle: TextField(
              onChanged: (value) {
                "lectures[index]['time'] = value";
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
    );
  }
}