import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/db/model/student_model.dart';
import 'package:student_app_provider/list_student/grid_view.dart';
import 'package:student_app_provider/list_student/list_view.dart';

class Liststudent extends StatelessWidget {
  const Liststudent({super.key});

  @override
  Widget build(BuildContext context) {
    Studentcontoller gridcontroller = Provider.of(context);
    return Consumer<Studentcontoller>(
      builder: (context, value, child) {
        final values = value.students;
        print(values);
        List<Studentmodel> reversedList = values.reversed.toList();
        return gridcontroller.isgrid == true
            ? GridviewWidget(controller: value, reversedList: reversedList)
            : Listviewmodel(controller: value, reversedList: reversedList);
      },
    );
  }
}
