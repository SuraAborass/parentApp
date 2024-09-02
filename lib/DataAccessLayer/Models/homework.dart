class Homework {
  final int id;
  final String description;
  final String path;
  final bool hasAttachment;
  final String subjectName;

  Homework({
    required this.id,
    required this.description,
    required this.path,
    required this.hasAttachment,
    required this.subjectName,
  });

  factory Homework.fromMap(Map<String, dynamic> map) {
    var homeworkInfo = map['homework_info'];
    var subject = homeworkInfo['subject'];
    var accessories = homeworkInfo['accessories'] ?? [];

    var filePath = accessories.isNotEmpty
        ? accessories[0]['image_file_url'] as String
        : "";

    return Homework(
      id: homeworkInfo['id'] as int,
      description: homeworkInfo['description'] as String,
      path: filePath,
      hasAttachment: filePath.isNotEmpty,
      subjectName: subject != null ? subject['name'] as String : "",
    );
  }
}
