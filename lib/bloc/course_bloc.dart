import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_learn2/DbHelper.dart';
import 'package:sqlite_learn2/model/course.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  DbHelper db=DbHelper();
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) {
      if(event is AddEvent){
           db.createCourse(event.course) ;
    emit(SuccessState()) ;
      }

    });
  }
}
