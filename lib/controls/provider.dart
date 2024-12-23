import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_stdnt_mngmnt/model/student_model.dart';

class StudentProvider extends ChangeNotifier {

  final List<StudentModel> _students = [];
  List<StudentModel> get students => [..._students];

  void addStudent(String name, int age,int roll, String batch, int year) {
    final newStudent = StudentModel(
        id: DateTime.now().toString(),
        name: name,
        age: age,
        roll: roll,
        batch: batch,
        year: year);
    _students.add(newStudent);
    notifyListeners();
    log('user added');
  }

  void updateStudent(String id, String name, int age,int roll ,String batch, int year) {
    final index = _students.indexWhere((student) => student.id == id);
    if (index >= 0) {
      _students[index] = StudentModel(
        id: id, 
        name: name, 
        age: age,
        roll:roll,
        batch: batch,
        year: year);
      notifyListeners();
    }
  }

  void deleteStudent(String id){
    _students.removeWhere((student) => student.id == id);
    notifyListeners();
  }

}
