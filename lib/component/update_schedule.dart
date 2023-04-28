import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateSchedule extends StatelessWidget {
  const UpdateSchedule({super.key});

  @override
  Widget build(BuildContext context) {
      DateTime now = DateTime.now();

      String day = DateFormat.EEEE().format(now);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Today\'s Day'),
        ),
        body: Center(
          child: Text(
            'Today is $day',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );
  }
}