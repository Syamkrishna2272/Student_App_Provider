import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/db/model/student_model.dart';
import 'package:student_app_provider/edit_student/edit_controller.dart';
import 'package:student_app_provider/edit_student/edit_student.dart';

// ignore: must_be_immutable
class Listviewmodel extends StatelessWidget {
  Listviewmodel(
      {super.key, required this.controller, required this.reversedList});
  List<Studentmodel> reversedList;
  Studentcontoller controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<Studentcontoller>(
      builder: (context, value, child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = reversedList[index];
              return InkWell(
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                //     return Details(studentdetails: data);
                //   }));
                // },
                child: Card(
                  color: Colors.amber.shade500,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 34,
                          backgroundImage: FileImage(File(data.image)),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${data.name}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Age : ${data.age}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Phone : ${data.phone}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Place : ${data.place}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    final control = Provider.of<Editcontroll>(
                                        context,
                                        listen: false);
                                    control.oninit(data);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return Updatepage(
                                        studentdetails: data,
                                      );
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Colors.amber.shade500,
                                          content: const Text(
                                            'Photo options',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  value.deletestudent(data.id!);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 253, 17, 0),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 1,
              );
            },
            itemCount: controller.students.length);
      },
    );
  }
}
