import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/textfield_widget/textform.dart';

// ignore: must_be_immutable
class Studentadd extends StatelessWidget {
  Studentadd({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();

  final agecontroller = TextEditingController();

  final phonecontroller = TextEditingController();

  final placecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(21),
            child: Text(
              'Please Enter Details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: Consumer(
          builder: (context, value, child) {
            return TextFieldWidget(
              formkey: formkey,
              agecontroller: agecontroller,
              namecontroller: namecontroller,
              phonecontroller: phonecontroller,
              placecontroller: placecontroller,
              size: size,
              isfromedit: false,
            );
          },
        ));
  }
}
