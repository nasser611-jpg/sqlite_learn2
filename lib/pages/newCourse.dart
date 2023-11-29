import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/bloc/course_bloc.dart';
import 'package:sqlite_learn2/model/course.dart';

class Newcorse extends StatefulWidget {
  const Newcorse({Key? key}) : super(key: key);

  @override
  State<Newcorse> createState() => _NewcorseState();
}

class _NewcorseState extends State<Newcorse> {
  String? courseName;
  int? courHouse;
  String? courseConetent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DbHelper db = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add course'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'enter course name ,',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              onChanged: (value) {
                setState(() {
                  courseName = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'enter course content ,',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              onChanged: (value) {
                setState(() {
                  courseConetent = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'enter course horse ,',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  courHouse = int.parse(value);
                });
              },
            ),
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
      
                return TextButton(
                    onPressed: () async {
                      Course c = Course({
                        'name': courseName,
                        'content': courseConetent,
                        'hours': courHouse
                      });
                     db.createCourse(c);
                  //    BlocProvider.of<CourseBloc>(context).emit(SuccessState(c));
                    

                      Navigator.of(context).pop();
                    },
                    child: Text('Save'));
           
                
                }
            )
          ],
        )),
      ),
    );
  }
}
