import 'package:flutter/material.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/courseUpdate.dart';
import 'package:sqlite_learn2/model/course.dart';
import 'package:sqlite_learn2/pages/coursedetails.dart';
import 'package:sqlite_learn2/pages/newCourse.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper? helper;
  List course = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    helper!.getAllCourses();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'sqlDatabase',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Newcorse(),
                  ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
            future: helper!.getAllCourses(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Course course = Course.fromMap(snapshot.data![index]);
                    return Card(
                      child: ListTile(
                       
                        title: Text('${course.name} - ${course.hours} hrs'),
                        subtitle: Text('${course.content}'),
                        trailing:Column(children: [
                           Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                helper!.delete(course.id);
                              });
                            },
                          ),
                        ),
                         Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Update(course),
                        ));
                              });
                            },
                          ),
                        ),
                        ]),

                         onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Details(course),
                        )),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
