import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Constants/links.dart';
import '../Models/exam_result.dart';


class StudentMarkClient {
  Future<dynamic> fetchStudentMarks(String token, int sonId) async {
    var response = await http.get(
      Uri.parse("${baseLink}parent/display_mark/$sonId"), // استخدام sonId هنا
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
