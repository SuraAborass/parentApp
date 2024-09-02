import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../BusinessLayer/Controllers/profile_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';
import '../../../main.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Public/text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        backgroundColor: UIColors.white,
        appBar: instituteAppBar(
          title: Text(
            "الملف الشخصي",
            style: UITextStyle.titleBold.copyWith(fontSize: 22),
          ),
        ),
        drawer: InstituteDrawer(),
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Obx(() => CircleAvatar(
                                  backgroundColor: UIColors.primary,
                                  minRadius: 52,
                                  child: CircleAvatar(
                                    backgroundColor: UIColors.white,
                                    minRadius: 50,
                                    backgroundImage: profileController
                                        .isProfilePicPathSet.value
                                        ? FileImage(File(profileController
                                        .profilePicPath.value)) as ImageProvider
                                        : CachedNetworkImageProvider(MyApp
                                        .appUser!.image),
                                  ),
                                )),
                                Positioned(
                                  bottom: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => bottomSheet(context),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo_sharp,
                                      size: 30,
                                      color: UIColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${MyApp.appUser!.firstName} ${MyApp.appUser!.lastName}",
                              style: UITextStyle.titleBold.copyWith(
                                fontSize: 20,
                                color: UIColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    flex: 7,
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InstituteTextFormField(
                              controller: profileController.updatePhoneController,
                              hintText: 'رقم الهاتف',
                              borderColor: UIColors.primary,
                            ),
                            const SizedBox(height: 10),
                            InstituteTextFormField(
                              controller: profileController.updateAddressController,
                              hintText: 'العنوان',
                              borderColor: UIColors.primary,
                            ),
                            const SizedBox(height: 10),
                            InstituteTextFormField(
                              controller: profileController.updatePasswordController,
                              hintText: 'تغيير كلمة المرور',
                              borderColor: UIColors.primary,
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            InstituteTextFormField(
                              controller: profileController.updateConfirmPasswordController,
                              hintText: 'تأكيد كلمة المرور',
                              borderColor: UIColors.primary,
                              obscureText: true,
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: Get.width,
                              child: Obx(() {
                                return SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                    onPressed: profileController.loading.value
                                        ? null
                                        : () {
                                      profileController.updateInfo();
                                    },
                                    style: profileButtonStyle.copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                        profileController.loading.value ? UIColors.gray : UIColors.primary,
                                      ),
                                    ),
                                    child: profileController.loading.value
                                        ? CircularProgressIndicator(
                                      color: UIColors.white,
                                    )
                                        : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'تحديث معلوماتك',
                                          style: UITextStyle.titleBold
                                              .copyWith(fontSize: 15, color: UIColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      color: UIColors.white,
      height: 130,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "تعيين صورة الملف الشخصي",
              style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      profileController.takePhoto(ImageSource.camera);
                    },
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: UIColors.primary,
                      size: 40,
                    ),
                  ),
                  subtitle: Text(
                    "كاميرا",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      profileController.takePhoto(ImageSource.gallery);
                    },
                    child: const Icon(
                      Icons.image,
                      color: UIColors.primary,
                      size: 40,
                    ),
                  ),
                  subtitle: Text(
                    "معرض",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
