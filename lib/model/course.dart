// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  int? _id;
  String? _name;
  String ?_content;
  int ?_hours;

  Course(dynamic obj){
    _id=obj['id'];
     _name=obj['name'];
      _content=obj['content'];
       _hours=obj['hours'];
  }
  

 Course.fromMap(Map<String,dynamic>data){
  _id=data['id'];
  _name=data['name'];
  _content=data['content'];
  _hours=data['hours'];
 }


  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': _id,
      'name': _name,
      'content': _content,
      'hours': _hours,
    };
    
  }
  get id=>_id;
  get name=>_name;
  get content=>_content;
  get hours =>_hours;
}
