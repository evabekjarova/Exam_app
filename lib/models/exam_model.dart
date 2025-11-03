class Exam{

  String name;
  DateTime date;
  List<String> rooms;

  Exam({required this.name, required this.date, required this.rooms});

  Exam.fromJson(Map<String, dynamic> data):
      name = data['name'],
      date = DateTime.parse(data['date']),
      rooms = List<String>.from(data['rooms']);

  Map<String, dynamic> toJson() => {'name' : name, 'date' : date.toIso8601String(), 'rooms' : rooms};
}