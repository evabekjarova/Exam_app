import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exam_app/models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final List<Exam> exams;

  const ExamCard({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        final isPast = exam.date.isBefore(DateTime.now());
        final formattedDate = DateFormat('dd.MM.yyyy - HH:mm').format(exam.date);

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/details",
              arguments: exam,
            );
          },
          child: Card(
            color: isPast ? Colors.grey.shade300 : Colors.green.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                isPast ? Icons.check_circle_outline : Icons.pending_actions,
                color: isPast ? Colors.grey : Colors.green,
                size: 30,
              ),
              title: Text(
                exam.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("Датум: $formattedDate"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.meeting_room, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("Просторија: ${exam.rooms.join(', ')}"),
                    ],
                  ),
                ],
              ),
            ),

          ),

        );
      },
    );
  }
}
