import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/user_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UIColors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  "assets/images/lo2.png",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text("تسجيل الدخول",
                    style: UITextStyle.bodyNormal
                        .copyWith(fontSize: 25, color: UIColors.primary)),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الايميل',
                        style: UITextStyle.bodyNormal
                            .copyWith(fontSize: 16, color: UIColors.black))
                  ],
                ),
              ),
              TextFormField(
                style: UITextStyle.titleBold.copyWith(color: Colors.black),
                controller: userController.emailTextController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: UIColors.white,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: UIColors.primary),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: UIColors.primary)),
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('كلمة المرور',
                        style: UITextStyle.bodyNormal.copyWith(
                            fontSize: 16,
                            color: UIColors.black,
                            fontWeight: FontWeight.normal))
                  ],
                ),
              ),
              Obx(() {
                return TextFormField(
                  style: UITextStyle.titleBold.copyWith(color: Colors.black),
                  controller: userController.passwordTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: UIColors.white,
                    suffixIcon: IconButton(
                      icon: Icon(!userController.passwordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: UIColors.gray,
                      onPressed: () {
                        userController.togglePasswordVisible();
                      },
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: UIColors.primary),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: UIColors.primary)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !userController.passwordVisible.value,
                  maxLines: 1,
                );
              }),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                height: 56,
                minWidth: Get.width,
                color: UIColors.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (userController.sending.value == true)
                        const CircularProgressIndicator(),
                      Text('المتابعة',
                          style: UITextStyle.titleBold.copyWith(fontSize: 22))
                    ],
                  );
                }),
                onPressed: () async {
                  await userController.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
