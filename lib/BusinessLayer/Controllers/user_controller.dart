import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Constants/get_routes.dart';
import '../../DataAccessLayer/Clients/box_client.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/Widgets/Public/snackbars.dart';
import '../../main.dart';

class UserController extends GetxController {
  final BoxClient boxClient = BoxClient();
  final box = GetStorage();
  User? user;
  bool authed = false;
  var passwordVisible = false.obs;
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var sending = false.obs;
  var repo = UserRepo();

  @override
  void onInit() async {
    super.onInit();
    authed = await boxClient.getAuthState();
    if (authed) {
      user = await boxClient.getAuthedUser();
      final token = box.read('token');
      if (token != null) {
        user!.token = token;
      }
      update();
      print(user!.toMap());
    }
    update();
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }

  Future<void> login() async {
    sending.value = true;
    if (emailTextController.value.text.isNotEmpty &&
        passwordTextController.value.text.isNotEmpty) {
      User? user = await repo.login(
        emailTextController.value.text,
        passwordTextController.value.text,
      );
      if (user != null) {
        MyApp.appUser = user;
        await saveAuthState(user);
        SnackBars.showSuccess("مرحباً");
      } else {
        SnackBars.showWarning('بياناتك غير مطابقة لسجلاتنا');
      }
    } else {
      SnackBars.showError("الرجاء تعبئة الحقول المطلوبة");
    }
    sending.value = false;
  }

  Future<void> saveAuthState(User user) async {
    await boxClient.setAuthedUser(user);
    await box.write('token', user.token);
    this.user = user;
    update();
    Get.offAndToNamed(AppRoutes.sonsScreen);
  }

  Future<void> logout() async {
    await boxClient.removeUserData();
    await box.remove('token');
    user = null;
    Get.toNamed(AppRoutes.loginScreen);
  }
}
