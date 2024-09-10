import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/absences_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/absence.dart';
import '../Public/snackbars.dart';

class AbsenceItem extends StatelessWidget {
  AbsenceItem({super.key, required this.absence});

  final Absence absence;
  final AbsencesController absencesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: UIColors.error,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عرض التبرير إذا كان موجودًا، أو "غياب غير مبرر" إذا لم يتم التبرير بعد
          Text(
            absence.justification!.isNotEmpty ? absence.justification! : 'غياب غير مبرر',
            style: UITextStyle.titleBold,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(absence.date, style: UITextStyle.titleBold),
          const SizedBox(height: 10),
          // زر التبرير يظهر فقط إذا لم يكن هناك تبرير
          if (absence.justification!.isEmpty)
            Center(
              child: MaterialButton(
                height: 56,
                minWidth: 150,
                color: UIColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                onPressed: () {
                  _showJustificationDialog(context, absence);
                },
                child: Text(
                  'تبرير',
                  style: UITextStyle.titleBold.copyWith(
                    color: UIColors.error,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showJustificationDialog(BuildContext context, Absence absence) {
    final TextEditingController justificationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'إدخال التبرير',
            style: UITextStyle.titleBold.copyWith(color: UIColors.black),
          ),
          content: TextField(
            controller: justificationController,
            decoration: const InputDecoration(
              hintText: "أدخل التبرير هنا",
              hintStyle: UITextStyle.bodyNormal,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'إلغاء',
                style: UITextStyle.bodyNormal.copyWith(color: UIColors.primary, fontSize: 18),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                'إرسال',
                style: UITextStyle.bodyNormal.copyWith(color: UIColors.primary, fontSize: 18),
              ),
              onPressed: () async {
                String justification = justificationController.text;
                if (justification.isNotEmpty) {
                  await absencesController.justifyAbsence(context, absence.id, justification); // تمرير id الغياب هنا
                } else {
                  SnackBars.showError('يرجى إدخال نص التبرير');
                }
              },
            ),
          ],
        );
      },
    );
  }
}

