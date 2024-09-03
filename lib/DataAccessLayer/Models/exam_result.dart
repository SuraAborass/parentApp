class Subject {
  final int id;
  final String name;
  final int numHour;
  final int successRate;
  final int classId;

  Subject({
    required this.id,
    required this.name,
    required this.numHour,
    required this.successRate,
    required this.classId,
  });

  factory Subject.fromMap(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      numHour: json['num_hour'],
      successRate: json['success_rate'],
      classId: json['class_id'],
    );
  }
}

class StudentMark {
  final int id;
  final double? ponus;
  final double? homework;
  final double? oral;
  final double? test1;
  final double? test2;
  final double? examMed;
  final double? examFinal;
  final int studentId;
  final Subject subject;

  StudentMark({
    required this.id,
    this.ponus,
    this.homework,
    this.oral,
    this.test1,
    this.test2,
    this.examMed,
    this.examFinal,
    required this.studentId,
    required this.subject,
  });

  factory StudentMark.fromMap(Map<String, dynamic> json) {
    return StudentMark(
      id: json['id'],
      ponus: json['ponus']?.toDouble(),
      homework: json['homework']?.toDouble(),
      oral: json['oral']?.toDouble(),
      test1: json['test1']?.toDouble(),
      test2: json['test2']?.toDouble(),
      examMed: json['exam_med']?.toDouble(),
      examFinal: json['exam_final']?.toDouble(),
      studentId: json['student_id'],
      subject: Subject.fromMap(json['subject']),
    );
  }
}
