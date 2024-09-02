class Program {
  final int id;
  final String url;
  final String type;

  Program({
    required this.id,
    required this.url,
    required this.type,
  });

  factory Program.fromMap(Map<String, dynamic> map) {
    return Program(
      id: map['id'] as int,
      url: map['image_file_url'] as String,
      type: map['type'] as String,
    );
  }
}
