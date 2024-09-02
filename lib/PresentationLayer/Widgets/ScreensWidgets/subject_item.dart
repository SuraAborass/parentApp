import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/subject.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.subject});
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // الحصول على `sonId` من GetStorage
        final int sonId = GetStorage().read('selectedSonId');

        // الانتقال إلى صفحة الوظائف مع تمرير `subjectId` و `sonId`
        Get.toNamed(AppRoutes.homeworks, arguments: {
          'subjectId': subject.id,
          'sonId': sonId,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: UIColors.primary,
        ),
        width: 180,
        height: 120,
        child: Center(
          child: Text(
            subject.name,
            style: UITextStyle.bodyNormal.copyWith(
              color: UIColors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
