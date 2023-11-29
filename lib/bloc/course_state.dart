part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}
class LoadingState extends CourseState{}
class SuccessState extends CourseState{
DbHelper db=DbHelper();
GetUsers(){
  db.createDatabase();
  db.getAllCourses();
}
  
  
}
class FailuarState extends CourseState{}