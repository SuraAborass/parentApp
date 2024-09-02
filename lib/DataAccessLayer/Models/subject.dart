
class Subject {
  final int id;
  final String name;
  final int successRate;

  Subject({
    required this.id,
    required this.name,
    required this.successRate,
  });
  factory Subject.zero()=>Subject(id: 0, name: "", successRate: 0);

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as int,
      name: map['name'] as String,
      successRate: map['success_rate'],
    );
  }
}