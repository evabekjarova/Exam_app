import 'package:flutter/material.dart';
import '../models/exam_model.dart';


class ExamDetails extends StatelessWidget{
  final Exam exam;
  const ExamDetails({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.date.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final isPast = difference.isNegative;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(title: Text("Распоред за испити - 223128", style: const TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface),
      body: Padding( padding: const EdgeInsets.all(16),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "Датум: ${exam.date.day.toString().padLeft(2,'0')}"
                      ".${exam.date.month.toString().padLeft(2,'0')}.${exam.date.year} - "
                      "${exam.date.hour.toString().padLeft(2,'0')}:"
                      "${exam.date.minute.toString().padLeft(2,'0')}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 4),
                Text(
                  "Испит: ${exam.name}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(),
              ],
            ),
            Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "Просторија ${exam.rooms.join(', ')}",
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 20),
            Text(
              isPast
                  ? "Испитот е завршен"
                  : "Преостанато време: $days дена, $hours часа",
              style: const TextStyle(fontSize: 18, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}