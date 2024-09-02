import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../DataAccessLayer/Clients/box_client.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/Widgets/Public/snackbars.dart';
import '../../main.dart';

class ProfileController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();

  TextEditingController updatePasswordController = TextEditingController();
  TextEditingController updateConfirmPasswordController = TextEditingController();
  TextEditingController updateAddressController =
  TextEditingController(text: MyApp.appUser!.address);
  TextEditingController updatePhoneController =
  TextEditingController(text: MyApp.appUser!.phone);

  var loading = false.obs;
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
    await imagePicker.pickImage(source: source, imageQuality: 100);
    if (pickedImage != null) {
      pickedFile = File(pickedImage.path);
      profilePicPath.value = pickedFile!.path;
      isProfilePicPathSet.value = true;
    }
    Get.back();
  }

  Future<void> updateInfo() async {
    if (updatePasswordController.text !=
        updateConfirmPasswordController.text) {
      SnackBars.showError(
          'كلمة المرور وتأكيد كلمة المرور غير متطابقتين');
      return;
    }

    loading.value = true;

    try {
      var response = await userRepo.updateInfo(
        MyApp.appUser!.token, // تأكد من أن التوكن غير فارغ وصالح
        updatePhoneController.text,
        updatePasswordController.text,
        updateConfirmPasswordController.text,
        updateAddressController.text,
        profilePicPath.value.isNotEmpty
            ? profilePicPath.value
            : null,
      );

      // طباعة الاستجابة للتحقق
      print(response);

      if (response != null) {
        User user = response;
        boxClient.setAuthedUser(user);
        MyApp.appUser = user;
        SnackBars.showSuccess('تم تحديث المعلومات بنجاح');
      } else {
        SnackBars.showError('تعذر تحديث المعلومات');
      }
    } catch (e) {
      print('Error: $e');
      SnackBars.showError('حدث خطأ أثناء محاولة تحديث المعلومات');
    } finally {
      loading.value = false;
    }
  }
}


