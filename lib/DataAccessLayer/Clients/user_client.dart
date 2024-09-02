import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class UserClient {
  Future<dynamic> login(email, password) async {
    var response = await http.post(Uri.parse(baseLink + loginLink),
        body:
        jsonEncode(<String, dynamic>{"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> updateInfo(
      String token,
      String phone,
      String password,
      String confPassword,
      String address,
      String? imagePath) async {
    var uri = Uri.parse("${baseLink}parent/edit_some_info_profile_parent");

    // إنشاء MultipartRequest
    var request = http.MultipartRequest('POST', uri);

    // إضافة رؤوس الطلب
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      // لاحظ أن 'Content-Type' لا يجب تحديدها هنا لأن MultipartRequest يتعامل معها تلقائيًا
    });

    // إضافة حقول النصوص
    request.fields['phone'] = phone;
    request.fields['password'] = password;
    request.fields['conf_password'] = confPassword;
    request.fields['address'] = address;

    // إذا كان هناك صورة، أضفها كملف
    if (imagePath != null && imagePath.isNotEmpty) {
      var imageFile = File(imagePath);
      if (await imageFile.exists()) {
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          'image', // تأكد من أن اسم الحقل يتطابق مع ما يتوقعه الخادم
          stream,
          length,
          filename: imageFile.path.split('/').last,
        );
        request.files.add(multipartFile);
      }
    }

    try {
      // إرسال الطلب
      var streamedResponse = await request.send();

      // الحصول على الاستجابة كـ String
      var response = await http.Response.fromStream(streamedResponse);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          return jsonDecode(response.body);
        } catch (e) {
          print('Error decoding response body: $e');
          return null;
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error during updateInfo request: $e');
      return null;
    }
  }
}
