import 'package:flutter/material.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/pages/home.dart';
void main()=>runApp( MyApp());


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   DbHelper db=DbHelper();
   
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}