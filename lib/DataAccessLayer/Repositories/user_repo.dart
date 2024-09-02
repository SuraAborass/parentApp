import 'dart:convert';
import '../Clients/user_client.dart';
import '../Models/user.dart';
import 'package:get_storage/get_storage.dart';

class UserRepo {
  var client = UserClient();

  Future<User?> login(String email, String password) async {
    var data = await client.login(email, password);
    print(data);
    if (data != null) {
      var jsonData = jsonDecode(data);
      var user = User.fromMap(jsonData);
      final storage = GetStorage();
      storage.write('userToken', user.token); // تخزين التوكن
      return user;
    }
    return null;
  }


  Future<User?> updateInfo(
      String token,
      String phone,
      String password,
      String confPassword,
      String address,
      String? image) async {
    print("Token: $token");
    print("Phone: $phone");
    print("Password: $password");
    print("Confirm Password: $confPassword");
    print("Address: $address");
    print("Image Path: $image");

    var response = await client.updateInfo(
        token, phone, password, confPassword, address, image);

    if (response != null) {
      try {
        return User.fromMap(response);
      } catch (e) {
        print('Error parsing user data: $e');
        return null;
      }
    } else {
      print('Update failed, no response received.');
      return null;
    }
  }

}
