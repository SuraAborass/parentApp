
class Course {
  final int id;
  final String name;
  final String description;
  final String startDate;
  final String finishDate;
  final String startTime;
  final String finishTime;
  final int cost;
  final int type;
  final String teacherFirstName;
  final String teacherLastName;


  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
    required this.type,
    required this.startDate,
    required this.finishDate,
    required this.startTime,
    required this.finishTime,
    required this.teacherFirstName,
    required this.teacherLastName
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['course']['id'] as int,
      name: map['course']['name_course'] as String,
      description: map['course']['description'],
      cost: map['course']['cost_course'],
      startDate: map['course']['start_date'],
      finishDate: map['course']['finish_date'],
      startTime: map['course']['start_time'],
      finishTime: map['course']['finish_time'],
      teacherFirstName: map['course']['teacher']['user']['first_name'],
      teacherLastName: map['course']['teacher']['user']['last_name'],
      type: map['student_type'],
    );
  }
}