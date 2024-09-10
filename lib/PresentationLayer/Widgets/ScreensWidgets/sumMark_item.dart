import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/sumMark.dart';

class SumMarkItem extends StatelessWidget {
  const SumMarkItem({super.key, required this.studentResult});
  final StudentResult studentResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: studentResult.subjects.map((subject) {
        // تحديد اللون بناءً على حالة النجاح أو الرسوب
        Color resultColor = subject.isPassed == "Passed" ? UIColors.success : UIColors.error;
        String resultText = subject.isPassed == "Passed" ? "ناجح" : "راسب";

        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                    subject.subjectName,
                    style: UITextStyle.titleBold.copyWith(
                      color: UIColors.primary,
                      fontSize: 20,
                    ),
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
                          subject.totalMarks.toString(),
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
                          resultText,
                          style: UITextStyle.titleBold.copyWith(
                            color: resultColor,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            decorationColor: resultColor,
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
      }).toList(),
    );
  }
}
