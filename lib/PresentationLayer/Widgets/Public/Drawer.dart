import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/user_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../main.dart';

class InstituteDrawer extends StatelessWidget {
   InstituteDrawer({super.key});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColors.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: UIColors.secondary),
            accountName: Text(
                MyApp.appUser != null ? MyApp.appUser!.firstName+" "+MyApp.appUser!.lastName :
                "اسم أحد الأبوين",
                style: UITextStyle.titleBold.copyWith(color: UIColors.white)),
            accountEmail: Text(
                MyApp.appUser != null ? MyApp.appUser!.email :
                "email@gmail.com",
                style: UITextStyle.bodyNormal
                    .copyWith(color: UIColors.white.withOpacity(.5))),
            currentAccountPicture:  CircleAvatar(
              backgroundImage: NetworkImage(MyApp.appUser!.image),
              backgroundColor: UIColors.primary,
            ),
          ),

          if (MyApp.appUser != null)
            ListTile(
              onTap: () async {
                await userController.logout();
              },
              leading: const Icon(
                Icons.logout,
                color: UIColors.white,
                size: 30,
              ),
              title: Text(
                "تسجيل الخروج",
                style: UITextStyle.bodyNormal.copyWith(color: UIColors.white),
              ),
            ),
        ],
      ),
    );
  }
}
