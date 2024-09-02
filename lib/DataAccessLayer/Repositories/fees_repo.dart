import 'dart:convert';
import '../Clients/fees_client.dart';
import '../Models/fee.dart';

class FeesRepo {
  FeesClient client = FeesClient();

  Future<List<Fee>> getFees(String token, int sonId) async {
    var response = await client.getFees(token, sonId);
    if (response != "") {
      final Map<String, dynamic> data = json.decode(response);

      // تأكد من أن data['payments'] تحتوي على قائمة من المدفوعات
      if (data.containsKey('payments')) {
        return (data['payments'] as List)
            .map<Fee>((json) => Fee.fromMap(json))
            .toList();
      }
    }
    return [];
  }
}
