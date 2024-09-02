import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class CoursesClient {
  Future<dynamic> getCourses(String token, int sonId) async {
    var response = await http.get(
      Uri.parse("${baseLink}parent/course_my_sun/$sonId"), // استخدام sonId هنا
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
