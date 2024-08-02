import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app_provider/db/model/student_model.dart';

class Studentcontoller extends ChangeNotifier {
  late Database _db;

  bool get isgrid => _isgrid;
  bool _isgrid = false;
  List<Studentmodel> _students = [];

  setlistbool(bool val) {
    if (_isgrid == true && val == true) {
      _isgrid = false;
    } else {
      _isgrid = true;
    }
    notifyListeners();
  }

  Studentcontoller() {
    initializingdatabase();
    print('success');
  }

  Future<void> initializingdatabase() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute('''CREATE TABLE student(
          id INTEGER PRIMARY KEY,
          name TEXT,
          age TEXT,
          phone TEXT,
          place TEXT,
          image TEXT
          )''');
    });
    getallstudent();
  }

  Future<void> addstudent1(Studentmodel value) async {
    await _db.execute(
        'INSERT INTO student(name,age,phone,place,image)VALUES(?,?,?,?,?)',
        [value.name, value.age, value.phone, value.place, value.image]);

    getallstudent();
    notifyListeners();
  }

  List<Studentmodel> get students => _students;

  Future<void> getallstudent() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    print(values);
    _students.clear();
    for (var map in values) {
      final student = Studentmodel.fromMap(map);
      _students.add(student);
    }
    notifyListeners();
  }

  Future<void> deletestudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getallstudent();
  }

  Future<void> updatestudent(int id, String name, String age, String phone,
      String place, String image) async {
    print('id===$id');
    final data = {
      'name': name,
      'age': age,
      'phone': phone,
      'place': place,
      'image': image,
    };
    await _db.update('student', data, where: 'id=?', whereArgs: [id]);
    print('updated');
    getallstudent();
  }
}
