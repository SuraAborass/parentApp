import 'package:get_storage/get_storage.dart';
import '../Models/user.dart';

class BoxClient {
  var box = GetStorage();

  Future<bool> getAuthState() async {
    print(box.read('authed'));
    return await box.read('authed') != null;
  }

  Future<User> getAuthedUser() async {
    print(await box.read('userdata'));
    var userMap = await box.read('userdata');
    var token = await box.read('token');
    var user = User.fromBoxMap(userMap);
    user.token = token;
    return user;
  }

  Future<void> setAuthedUser(User user) async {
    await box.write('authed', true);
    await box.write('userdata', user.toMap());
    await box.write('token', user.token);
  }

  Future<void> removeUserData() async {
    await box.remove('authed');
    await box.remove('userdata');
    await box.remove('token');
  }
}
