import 'package:flutter/material.dart';
import 'package:guideconnect/component/Events.dart';
import 'package:guideconnect/component/Lecture.dart';
import 'package:guideconnect/component/My_square.dart';


class Display extends StatelessWidget {
  final String Ison;
  const Display(this.Ison);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 61,
      margin: const EdgeInsets.only(top: 45),
      child: Column(
        children: [
          Ison=="Schedule"
          ?const Lectures()
          :Ison=="Events"
          ?const Events()
          :Ison=="Assignments"
          ?MySquare(child: "Assigments")
          :MySquare(child: "setting"),
        ],
      ),
    );
  }
}