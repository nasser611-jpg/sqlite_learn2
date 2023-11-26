import 'package:flutter/material.dart';
import 'package:sqlite_learn2/model/course.dart';

class Details extends StatelessWidget {
  final Course course;

  Details(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text(
          course.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              course.content,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Hours: ${course.hours}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}