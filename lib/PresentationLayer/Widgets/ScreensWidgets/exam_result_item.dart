import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/exam_result.dart';

class ExamResultItem extends StatelessWidget {
  final List<StudentMark> marks; // نمرر قائمة من العلامات

  const ExamResultItem({super.key, required this.marks});

  @override
  Widget build(BuildContext context) {
    List<Widget> examSections = [];

    // عرض القسم الخاص بالامتحان الشفهي فقط إذا كانت هناك مواد تحتوي على نتيجة لهذا الامتحان
    List<StudentMark> oralMarks = marks.where((mark) => mark.oral != null).toList();
    if (oralMarks.isNotEmpty) {
      examSections.add(buildExamSection("الامتحان الشفهي", oralMarks));
    }

    // عرض القسم الخاص بالمذاكرة الأولى
    List<StudentMark> test1Marks = marks.where((mark) => mark.test1 != null).toList();
    if (test1Marks.isNotEmpty) {
      examSections.add(buildExamSection("المذاكرة الأولى", test1Marks));
    }

    // عرض القسم الخاص بالمذاكرة الثانية
    List<StudentMark> test2Marks = marks.where((mark) => mark.test2 != null).toList();
    if (test2Marks.isNotEmpty) {
      examSections.add(buildExamSection("المذاكرة الثانية", test2Marks));
    }

    // عرض القسم الخاص بالامتحان النصفي
    List<StudentMark> examMedMarks = marks.where((mark) => mark.examMed != null).toList();
    if (examMedMarks.isNotEmpty) {
      examSections.add(buildExamSection("الامتحان النصفي", examMedMarks));
    }

    // عرض القسم الخاص بالامتحان النهائي
    List<StudentMark> examFinalMarks = marks.where((mark) => mark.examFinal != null).toList();
    if (examFinalMarks.isNotEmpty) {
      examSections.add(buildExamSection("الامتحان النهائي", examFinalMarks));
    }

    return SingleChildScrollView(
      child: Column(
        children: examSections,
      ),
    );
  }

  // دالة لإنشاء قسم امتحان
  Widget buildExamSection(String examType, List<StudentMark> marks) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: UIColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              examType,
              style: UITextStyle.titleBold.copyWith(color: UIColors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          ...marks.map((mark) => buildSubjectResult(mark.subject.name, getExamResult(mark, examType), mark.subject.successRate)).toList(),
        ],
      ),
    );
  }

  // دالة للحصول على نتيجة الامتحان بناءً على نوعه
  double getExamResult(StudentMark mark, String examType) {
    switch (examType) {
      case "الامتحان الشفهي":
        return mark.oral!;
      case "المذاكرة الأولى":
        return mark.test1!;
      case "المذاكرة الثانية":
        return mark.test2!;
      case "الامتحان النصفي":
        return mark.examMed!;
      case "الامتحان النهائي":
        return mark.examFinal!;
      default:
        return 0.0;
    }
  }

  // دالة لإنشاء بوكس النتيجة لكل مادة
  Widget buildSubjectResult(String subjectName, double result, int successRate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Container(
            width: 330,
            height: 60,
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
                style: UITextStyle.titleBold.copyWith(color: UIColors.primary, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              width: 150,
              height: 60,
              decoration: const BoxDecoration(
                color: UIColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
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
                      successRate.toString(),
                      style: UITextStyle.titleBold.copyWith(
                        color: UIColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
