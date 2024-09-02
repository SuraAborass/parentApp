import 'package:flutter/material.dart';
import '../../../BusinessLayer/Controllers/splash_controller.dart';
import '../../../Constants/colors.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        body: Center(
          child: Image.asset(
            'assets/images/lo2.png',
            height: 170,
            width: 170,
            fit: BoxFit.cover,
          ),
        )
    );
  }
}
