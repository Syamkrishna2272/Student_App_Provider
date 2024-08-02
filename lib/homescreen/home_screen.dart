import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/add_student/add_student.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/list_student/list_student.dart';
import 'package:student_app_provider/search_page/search_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Consumer<Studentcontoller>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.setlistbool(true);
                },
                icon: Icon(value.isgrid == true
                    ? Icons.grid_view_rounded
                    : Icons.list_alt_rounded)),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: Search(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ],
          backgroundColor: Colors.amber.shade500,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(flex: 8, child: const Liststudent()),
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.amber.shade500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Studentadd();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0)),
                          child: const Text(
                            'Add student',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ))
          ],
        )));
  }
}
