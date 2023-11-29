import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/bloc/course_bloc.dart';
import 'package:sqlite_learn2/pages/home.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  DbHelper db = DbHelper();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
