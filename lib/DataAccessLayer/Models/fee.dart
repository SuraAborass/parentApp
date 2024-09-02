class Fee {
  final int id;
  final String type;
  final String date;
  final int amountMoney;  // تعديل النوع إلى int
  final int remainingFee; // تعديل النوع إلى int

  Fee({
    required this.id,
    required this.type,
    required this.date,
    required this.amountMoney,
    required this.remainingFee,
  });

  // factory لتلقي البيانات من كل عنصر في قائمة payments
  factory Fee.fromMap(Map<String, dynamic> map) {
    return Fee(
      id: map['id'] as int,
      type: map['type'] as String,
      date: map['date'] as String,
      amountMoney: map['amount_money'] as int,
      remainingFee: map['remaining_fee'] as int,
    );
  }
}
