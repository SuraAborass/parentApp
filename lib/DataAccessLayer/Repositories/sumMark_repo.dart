import 'dart:convert';
import '../Clients/sumMark_client.dart';
import '../Models/sumMark.dart';

class SumMarkRepository {
  SumMarkClient client = SumMarkClient();

  Future<List<StudentResult>> fetchSumMarks(String token,int sonId) async {
    var response = await client.fetchSumMarks(token,sonId);
    if (response != "") {
      final data = json.decode(response);

      // تحقق مما إذا كان الرد يحتوي على قائمة أو كائن
      if (data is List) {
        // إذا كانت النتيجة قائمة
        return data.map<StudentResult>((json) => StudentResult.fromMap(json)).toList();
      } else if (data is Map<String, dynamic>) {
        // إذا كانت النتيجة كائن يحتوي على بيانات الطالب
        return [StudentResult.fromMap(data)];
      }
    }
    return [];
  }
}
