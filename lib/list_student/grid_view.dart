
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/db/model/student_model.dart';
import 'package:student_app_provider/edit_student/edit_controller.dart';
import 'package:student_app_provider/edit_student/edit_student.dart';
import 'package:student_app_provider/search/search_details.dart';

// ignore: must_be_immutable
class GridviewWidget extends StatelessWidget {
  GridviewWidget(
      {super.key, required this.controller, required this.reversedList});
  List<Studentmodel> reversedList;
  Studentcontoller controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: reversedList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (ctx, index) {
          final data = reversedList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Details(studentdetails: data);
              }));
            },
            child: Card(
                color: Colors.amber.shade500,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopupMenuButton(onSelected: (value) {
                              final control = Provider.of<Editcontroll>(context,
                                  listen: false);
                              control.oninit(data);
                              if (value == 'edit') {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return Updatepage(
                                    studentdetails: data,
                                  );
                                }));
                              }

                              if (value == 'delete') {
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
                                              controller
                                                  .deletestudent(data.id!);
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
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }, itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  textStyle: TextStyle(color: Colors.black),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('Edit'),
                                      )
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  textStyle: TextStyle(color: Colors.black),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 253, 17, 0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('Delete'),
                                      )
                                    ],
                                  ),
                                )
                              ];
                            })
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Name : ${data.name}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Age : ${data.age}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Phone : ${data.phone}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Place : ${data.place}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ]),
                )),
          );
        });
  }
}
