import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/exam_result.dart';

class ExamResultItem extends StatelessWidget {
  final StudentMark mark;

  const ExamResultItem({super.key, required this.mark});

  @override
  Widget build(BuildContext context) {
    String examType;
    double? result;

    if (mark.oral != null) {
      examType = "الامتحان الشفهي";
      result = mark.oral;
    } else if (mark.test1 != null) {
      examType = "المذاكرة الأولى";
      result = mark.test1;
    } else if (mark.test2 != null) {
      examType = "المذاكرة الثانية";
      result = mark.test2;
    } else if (mark.examMed != null) {
      examType = "الامتحان النصفي";
      result = mark.examMed;
    } else if (mark.examFinal != null) {
      examType = "الامتحان النهائي";
      result = mark.examFinal;
    } else if (mark.homework != null) {
      examType = "الوظائف";
      result = mark.homework;
    } else if (mark.ponus != null) {
      examType = "علامات إضافية";
      result = mark.ponus;
    } else {
      examType = "لا توجد بيانات";
      result = 0.0;
    }

    return SizedBox(
      width: 330,
      height: 330,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: 330,
              height: 300,
              decoration: BoxDecoration(
                  color: UIColors.white,
                  border: Border.all(color: UIColors.primary, width: 1),
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 28,
                decoration: BoxDecoration(
                    color: UIColors.white,
                    border: Border.all(color: UIColors.primary, width: 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                      examType,
                      style: UITextStyle.bodyNormal
                          .copyWith(color: UIColors.primary, fontSize: 18),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(top: 23),
                height: 60,
                child: subjects(context, mark.subject.name, result!),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget subjects(BuildContext context, String subjectName, double result) {
    return Stack(
      children: [
      Container(
      width: 318,
      height: 42,
      decoration: BoxDecoration(
      color: UIColors.resultColor,
      borderRadius: BorderRadius.circular(16),
    ),
    ),
    Positioned(
    right: 0,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    subjectName,
    style: UITextStyle.titleBold
        .copyWith(color: UIColors.primary, fontSize: 20),
    ),
    ),
    ),
    Positioned(
    left: 0,
    child: Container(
    width: 134,
    height: 42,
    decoration: const BoxDecoration(
    color: UIColors.primary,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16),
    bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
    ),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    result.toString(),
    style: UITextStyle.titleBold.copyWith(
    color: UIColors.white,
    fontSize: 20,
    ),
    ),
    const SizedBox(width: 5),
     Text(
    "/",
    style: UITextStyle.titleBold.copyWith(
    color: UIColors.white,
    fontSize: 20,
    ),
    ),
    const SizedBox(width: 5),
    Text(
    mark.subject.successRate.toString(),
    style: UITextStyle.titleBold.copyWith(
    color: UIColors.white,
    fontSize: 20,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    );
  }
}
