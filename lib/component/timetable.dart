import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('schedule').doc().collection('mondey')
            .orderBy('atcreate', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          final _timetable = snapshot.data?.docs;
          var timetablelen;
          timetablelen=0;
          if(_timetable?.length != null){
              timetablelen=_timetable?.length;
          }
          
          return ListView.separated(
            itemCount: timetablelen ,
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 16),
            itemBuilder: (BuildContext context, int index) {
              print(_timetable?[index]['Time']);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    _timetable?[index]['Time'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    _timetable?[index]['Lecture'],
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
          );
        },
      ),
    );
  }
}
