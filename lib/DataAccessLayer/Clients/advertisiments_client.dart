import 'package:http/http.dart' as http;
import '../../Constants/links.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class AdvertsClient {
  Future<dynamic> getAdverts() async {
    final storage = GetStorage();
    final token = storage.read('token');

    if (token == null) {
      throw Exception('User token is missing.');
    }

    var response = await http.get(
      Uri.parse(baseLink + ads),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}