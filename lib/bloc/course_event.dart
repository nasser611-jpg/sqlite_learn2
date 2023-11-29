// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_bloc.dart';

@immutable
class CourseEvent {}

class AddEvent extends CourseEvent {
  Course course;

   DbHelper db=DbHelper();
  AddEvent({required this.course});
  
}

class UpdateEvent extends CourseEvent {
  Course course;

  UpdateEvent({
    required this.course,
  });
}

class DeleteEvent extends CourseEvent{
  final int id;

  DeleteEvent({required this.id});
  
}
