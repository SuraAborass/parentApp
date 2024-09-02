import 'package:get/get.dart';
import 'package:parent_app/BusinessLayer/Controllers/user_controller.dart';

import '../../Constants/get_routes.dart';
import '../../main.dart';

class SplashController extends GetxController {
  final UserController userController = Get.find();
  @override
  void onReady() {
    if (userController.authed == true) {
      if (userController.user != null) {
        MyApp.appUser = userController.user;
      }

      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoutes.sonsScreen));
      ;
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoutes.loginScreen));
    }
    super.onReady();
  }
}

