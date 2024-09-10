import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Constants/links.dart';
import '../Models/exam_result.dart';


class SumMarkClient {
  Future<dynamic> fetchSumMarks(String token,int sonId) async {
    var response = await http.get(
      Uri.parse("${baseLink}parent/last_result/$sonId"), // استخدام sonId هنا
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
