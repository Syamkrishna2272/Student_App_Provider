import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/db/model/student_model.dart';

snackbar(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 232, 107, 99),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
    ),
  ));
}


Future<void> addstudent(namecontroller, agecontroller, phonecontroller,
    placecontroller,  formkey, context) async {
  final control = Provider.of<Studentcontoller>(context, listen: false);
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (formkey.currentState!.validate() ) {
    final studentvalues = Studentmodel(
      name: name,
      age: age,
      phone: phone,
      place: place,

    );

    await control.addstudent1(studentvalues);
    namecontroller.text = '';
    agecontroller.text = '';
    phonecontroller.text = '';
    placecontroller.text = '';
    Navigator.of(context).pop();
    snackbar('Submitted', context);
  } else {
    snackbar('Please add your photo', context);
  }
}

Future<void> update(
    ctx,
    id,
    namecontroller,
    agecontroller,
    phonecontroller,
    placecontroller,
      keybottom,
    editcontroller,
    context) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (keybottom.currentState!.validate()) {
    await Provider.of<Studentcontoller>(context, listen: false).updatestudent(
      id,
      name,
      age,
      phone,
      place,
    );
    Navigator.of(context).pop();
    editcontroller.namecontroller.text = '';
    editcontroller.agecontroller.text = '';
    editcontroller.phonecontroller.text = '';
    editcontroller.placecontroller.text = '';

    snackbar('Updated', context);
  }
}
