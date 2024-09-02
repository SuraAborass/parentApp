import 'dart:convert';
import '../Clients/sons_client.dart';
import '../Models/son.dart';

class SonsRepo {
  SonsClient client = SonsClient();

  Future<List<Son>> getSons(String token) async {
    var response = await client.getSons(token);
    if (response != "") {
      final data = json.decode(response);
      List<Son> sons = [];
      // استخراج قائمة الأبناء من الاستجابة
      for (var parent in data) {
        var students = parent['student'] as List<dynamic>;
        for (var student in students) {
          sons.add(Son.fromMap(student));
        }
      }
      return sons;
    }
    return [];
  }
}
