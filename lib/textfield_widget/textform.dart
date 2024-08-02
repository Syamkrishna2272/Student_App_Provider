import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app_provider/db/functions/image_picker.dart';
import 'package:student_app_provider/edit_student/edit_controller.dart';
import 'package:student_app_provider/snackbar&functions/snack&func.dart';
// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextEditingController namecontroller;

  TextEditingController agecontroller;

  TextEditingController phonecontroller;

  TextEditingController placecontroller;

  TextFieldWidget(
      {super.key,
      required this.formkey,
      required this.agecontroller,
      required this.imageController,
      required this.namecontroller,
      required this.phonecontroller,
      required this.placecontroller,
      required this.size,
      required this.isfromedit,
      this.editcontroller});

  Size size;
  GlobalKey formkey;
  Imagecontroller imageController;
  bool isfromedit;
  Editcontroll? editcontroller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        isfromedit == true
                            ? CircleAvatar(
                                radius: size.height / 17,
                                backgroundImage: imageController.istrue == true
                                    ? FileImage(imageController.image1)
                                    : editcontroller!.image != null
                                        ? FileImage(
                                            File(editcontroller!.image!))
                                        : const AssetImage(
                                                'assets/images/graduated.png')
                                            as ImageProvider,
                              )
                            : CircleAvatar(
                                radius: size.height / 17,
                                backgroundImage: imageController.istrue == true
                                    ? FileImage(imageController.image1)
                                    : const AssetImage(
                                            'assets/images/graduated.png')
                                        as ImageProvider,
                              ),
                        Positioned(
                          bottom: -10,
                          right: -12,
                          child: IconButton(
                              onPressed: () {
                                pickimages(imageController, context);
                              },
                              icon: const Icon(Icons.add_a_photo)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 38,
                    ),
                    SizedBox(
                      height: size.height / 10,
                      width: size.width / 1.3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        controller: namecontroller,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            labelText: '   Name'),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    SizedBox(
                      height: size.height / 10,
                      width: size.width / 1.3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter age';
                          }
                          return null;
                        },
                        controller: agecontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.date_range),
                            border: OutlineInputBorder(),
                            labelText: ' Age'),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    SizedBox(
                      height: size.height / 10,
                      width: size.width / 1.3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        controller: phonecontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    SizedBox(
                      height: size.height / 10,
                      width: size.width / 1.3,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter place';
                          }
                          return null;
                        },
                        controller: placecontroller,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.place),
                            border: OutlineInputBorder(),
                            labelText: 'Place'),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 70,
                    ),
                    SizedBox(
                      height: size.height / 18,
                      width: size.width / 1.3,
                      child: isfromedit == true
                          ? ElevatedButton(
                              onPressed: () {
                                update(
                                    context,
                                    editcontroller?.id,
                                    editcontroller?.namecontroller.value,
                                    editcontroller?.agecontroller.value,
                                    editcontroller?.phonecontroller.value,
                                    editcontroller?.placecontroller.value,
                                    formkey,
                                    imageController,
                                    editcontroller,
                                    context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber.shade500),
                              child: const Text(
                                'Update',
                                style: TextStyle(color: Colors.black),
                              ))
                          : ElevatedButton(
                              onPressed: () {
                                addstudent(
                                    namecontroller,
                                    agecontroller,
                                    phonecontroller,
                                    placecontroller,
                                    imageController,
                                    formkey,
                                    context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber.shade500),
                              child: const Text(
                                'Add studdent',
                                style: TextStyle(color: Colors.black),
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
