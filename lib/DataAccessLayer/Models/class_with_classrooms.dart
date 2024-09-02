import 'classroom.dart';


class ClassTeacher {
  final int id;
  final String name;
  final List<Classroom> classrooms;
  ClassTeacher({
    required this.id,
    required this.name,
    required this.classrooms,
  });

  factory ClassTeacher.fromMap(Map<String, dynamic> map) {
    return ClassTeacher(
      id: map['id'] as int,
      name: map['name'] as String,
      classrooms: List<Classroom>.from(
        (map['classrooms' ] as List<dynamic>).map<Classroom>(
              (l) => Classroom.fromMap(l as Map<String, dynamic>),
        ),
      ),
    );
  }
}