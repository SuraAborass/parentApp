
class Note {
  final int id;
  final String type;
  final String text;

  Note({
    required this.id,
    required this.type,
    required this.text,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      type: map['type'] as String,
      text: map['text'],
    );
  }
}