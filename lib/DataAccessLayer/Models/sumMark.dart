class Subject {
  final int subjectId;
  final String subjectName;
  final int totalMarks;
  final String isPassed;

  Subject({
    required this.subjectId,
    required this.subjectName,
    required this.totalMarks,
    required this.isPassed,
  });

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      subjectId: map['subject_id'] ?? 0,
      subjectName: map['subject_name'] ?? '',
      totalMarks: map['total_marks'] ?? 0,
      isPassed: map['is_passed'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject_id': subjectId,
      'subject_name': subjectName,
      'total_marks': totalMarks,
      'is_passed': isPassed,
    };
  }
}

class StudentResult {
  final String studentId;  // تغيير إلى String لأن الاستجابة ترجع String
  final String overallResult;
  final List<Subject> subjects;

  StudentResult({
    required this.studentId,
    required this.overallResult,
    required this.subjects,
  });

  factory StudentResult.fromMap(Map<String, dynamic> map) {
    return StudentResult(
      studentId: map['student_id'] ?? '0',  // تعديل هنا
      overallResult: map['overall_result'] ?? '',
      subjects: List<Subject>.from(
        map['subjects']?.map((subject) => Subject.fromMap(subject)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'overall_result': overallResult,
      'subjects': subjects.map((subject) => subject.toMap()).toList(),
    };
  }
}
