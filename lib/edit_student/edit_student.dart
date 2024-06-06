import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/model/student_model.dart';
import 'package:student_app_provider/edit_student/edit_controller.dart';
import 'package:student_app_provider/textfield_widget/textform.dart';

// ignore: must_be_immutable
class Updatepage extends StatelessWidget {
  Updatepage({super.key, this.studentdetails});
  Studentmodel? studentdetails;



  final GlobalKey<FormState> keybottom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Student',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: Consumer<Editcontroll>(
          builder: (context, value, child) {
            return TextFieldWidget(
              formkey: keybottom,
              agecontroller: value.agecontroller,
              namecontroller: value.namecontroller,
              phonecontroller: value.phonecontroller,
              placecontroller: value.placecontroller,
              size: size,
              isfromedit: true,
              editcontroller: value,
            );
          },
        ));
  }
}
