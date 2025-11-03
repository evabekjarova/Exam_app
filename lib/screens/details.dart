import 'package:flutter/material.dart';
import 'package:exam_app/models/exam_model.dart';
import 'package:exam_app/widgets/exam_details.dart';

class DetailsPage extends StatelessWidget {
  final Exam exam;
  const DetailsPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      body: ExamDetails(exam: exam),
    );
  }
}
