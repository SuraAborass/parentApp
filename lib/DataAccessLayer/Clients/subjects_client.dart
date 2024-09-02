import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class SubjectsClient {
  Future<dynamic> getSubjects(String token, int sonId) async {
    var response = await http.get(
      Uri.parse("${baseLink}parent/display_Subject_Sun/$sonId"),
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

  Future<dynamic> getHomeworks(int subjectId, int sonId, String token) async {
    var response = await http.get(
      Uri.parse("${baseLink}parent/display_homework_Sun/$sonId/$subjectId"),
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
}

