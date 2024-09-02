
class Classroom {
  final int id;
  final String name;
  final String teacher;
  Classroom({
    required this.id,
    required this.name,
    required this.teacher,
  });

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
        id: map['id'] as int,
      name: map['name'] as String,
        teacher: map['teacher'] as String,
    );
  }
}