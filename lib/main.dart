import 'package:exam_app/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/screens/home.dart';
import 'package:exam_app/models/exam_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред за испити - 223128'),
        "/details": (context) {
          final exam = ModalRoute.of(context)!.settings.arguments as Exam;
          return DetailsPage(exam: exam);
        },
      },
    );
  }
}
