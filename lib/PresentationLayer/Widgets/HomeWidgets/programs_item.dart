import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/get_routes.dart';

class ProgramsItem extends StatelessWidget {
  final int? sonId;

  const ProgramsItem({super.key, this.sonId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (sonId != null) {
          Get.toNamed(AppRoutes.programs, arguments: {'sonId': sonId});
        } else {
          // يمكنك هنا عرض رسالة خطأ أو التعامل مع الحالة التي لا يكون فيها sonId
          Get.snackbar('خطأ', 'رقم الابن غير متاح');
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 70,
        width: 360,
        decoration: BoxDecoration(
          color: UIColors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(width: 2, color: UIColors.primary),
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.checklist_rtl,
                size: 40,
                color: UIColors.purple,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "برامج الدوام والامتحانات",
                style: UITextStyle.bodyNormal.copyWith(
                    color: UIColors.purple, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
