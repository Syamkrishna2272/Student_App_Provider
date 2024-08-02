import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/functions/image_picker.dart';
import 'package:student_app_provider/db/functions/student_controller.dart';
import 'package:student_app_provider/edit_student/edit_controller.dart';
import 'package:student_app_provider/homescreen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var database = Studentcontoller();
  database.initializingdatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Studentcontoller()),
        ChangeNotifierProvider(create: (context) => Editcontroll()),
        ChangeNotifierProvider(create: (context) => Imagecontroller())
      ],
      child: MaterialApp(
        title: 'Student app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: const Homescreen(),
      ),
    );
  }
}
