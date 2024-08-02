import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/image_picker.dart';
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

pickimages(Imagecontroller imageController, context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.amber.shade500,
        content: const Text(
          'Photo options',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                imageController.fromcamera(context);
              },
              child: const Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
            onPressed: () {
              imageController.fromgallery(context);
            },
            child: const Text(
              'Gallery',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> addstudent(namecontroller, agecontroller, phonecontroller,
    placecontroller, imagecontroller, formkey, context) async {
  final control = Provider.of<Studentcontoller>(context, listen: false);
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final place = placecontroller.text.trim();

  if (formkey.currentState!.validate() && imagecontroller.istrue != false) {
    final studentvalues = Studentmodel(
      name: name,
      age: age,
      phone: phone,
      place: place,
      image: imagecontroller.image,
    );

    await control.addstudent1(studentvalues);
    namecontroller.text = '';
    agecontroller.text = '';
    phonecontroller.text = '';
    placecontroller.text = '';
    imagecontroller.setbool(false);
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
    imageController,
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
      imageController.istrue ? imageController.image : editcontroller.image,
    );
    Navigator.of(context).pop();
    editcontroller.namecontroller.text = '';
    editcontroller.agecontroller.text = '';
    editcontroller.phonecontroller.text = '';
    editcontroller.placecontroller.text = '';
    imageController.setbool(false);

    snackbar('Updated', context);
  }
}
