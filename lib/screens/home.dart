import 'package:exam_app/models/exam_model.dart';
import 'package:exam_app/widgets/exam_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> exams = [
    Exam(name: "Структурно програмирање",
        date: DateTime(2025, 11, 01, 9, 0),
        rooms: ["138"]),
    Exam(name: "Дискретна математика",
        date: DateTime(2025, 11, 16, 9, 30),
        rooms: ["3"]),
    Exam(name: "Веројатност и статистика",
        date: DateTime(2025, 11, 16, 17, 0),
        rooms: ["2"]),
    Exam(name: "Бизнис Статистика",
        date: DateTime(2025, 11, 18, 9, 0),
        rooms: ["B1"]),
    Exam(name: "Бази на податоци",
        date: DateTime(2025, 11, 19, 10, 0),
        rooms: ["215"]),
    Exam(name: "Маркетинг",
        date: DateTime(2025, 11, 17, 14, 0),
        rooms: ["13"]),
    Exam(name: "Оперативни системи",
        date: DateTime(2025, 11, 19, 16, 0),
        rooms: ["12"]),
    Exam(name: "Бизнис и менаџмент",
        date: DateTime(2025, 11, 17, 10, 0),
        rooms: ["215"]),
    Exam(name: "Претприемништво",
        date: DateTime(2025, 11, 16, 10, 0),
        rooms: ["B2.2"]),
    Exam(name: "Веб програмирање",
        date: DateTime(2025, 11, 21, 17, 0),
        rooms: ["200ab"]),
  ];

  @override
  void initState() {
    super.initState();
    exams.sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ExamCard(exams: exams),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${exams.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Испити",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}




