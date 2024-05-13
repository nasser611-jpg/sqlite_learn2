import 'package:flutter/material.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/pages/home.dart';
import 'package:sqlite_learn2/model/course.dart';

class Update extends StatefulWidget {
  final Course course;
  Update(this.course);
  DbHelper db = DbHelper();

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contentCOntroller = TextEditingController();

  TextEditingController hourCOntroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.course.name;
    contentCOntroller.text = widget.course.content;
    hourCOntroller.text = widget.course.hours.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: contentCOntroller,
              onChanged: (value) {
                contentCOntroller.text = value;
              },
            ),
            TextFormField(
              controller: hourCOntroller,
              onChanged: (value) {
                hourCOntroller.text = value;
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                         var updatedCourse = Course({
                    'id':widget.course.id,
                    'name': nameController.text,
                    'content': contentCOntroller.text,
                    'hours': int.parse(hourCOntroller.text)
                  });
                  widget.db.update(updatedCourse);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return Home();
                     },));
                  });
             
                },
                child: const Text('Save'))
          ],
        )),
      ),
    );
  }
}
