import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class SonsClient {
  Future<dynamic> getSons(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + sons),
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
