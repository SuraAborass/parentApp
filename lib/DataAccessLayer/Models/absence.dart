class Absence {
  final int id;
  final String date;
   String? justification;

  Absence({
    required this.id,
    required this.date,
     this.justification,
  });

  factory Absence.fromMap(Map<String, dynamic> map) {
    return Absence(
      id: map['id'] as int,
      date: map['date'] ,
      justification: map['justification'] ?? '',
    );
  }
}
