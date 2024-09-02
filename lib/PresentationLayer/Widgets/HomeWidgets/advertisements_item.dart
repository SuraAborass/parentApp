import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.ads);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 70,
        width: 360,
        decoration: BoxDecoration(
            color: UIColors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            border:
            Border.all(width: 2, color: UIColors.primary)),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Ionicons.radio_sharp,
                size: 40,
                color: UIColors.purple,
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                    "الإعلانات ",
                    style: UITextStyle.bodyNormal.copyWith(
                        color: UIColors.purple, fontSize: 20),
                  ),)
          ],
        ),
      ),
    );
  }
}
