import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class AbsencesClient {
  Future<dynamic> getAbsences(String token, int sonId) async {
    var response = await http.get(
      Uri.parse(baseLink + "parent/all_out_work_student/$sonId"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<Map<String, dynamic>> justifyAbsence(int absenceId, String token, String justification) async {
    var response = await http.post(
      Uri.parse(baseLink + 'parent/add_Justification/$absenceId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "justification": justification,
      }),
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    return {
      'statusCode': response.statusCode,
      'body': json.decode(response.body)
    };
  }


}
