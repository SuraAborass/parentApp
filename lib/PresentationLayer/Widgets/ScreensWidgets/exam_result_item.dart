import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';

class ExamResultItem extends StatelessWidget {
  const ExamResultItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "المذاكرة الأولى",
                      style: UITextStyle.bodyNormal
                          .copyWith(color: UIColors.primary, fontSize: 18),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 23),
                        height: 42,
                        child: subjects(context, index));
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget subjects(BuildContext context, index) {
    return Stack(
      children: [
        Container(
          width: 318,
          height: 42,
          decoration: BoxDecoration(
              color: UIColors.resultColor,
              borderRadius: BorderRadius.circular(16)),
        ),
        Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "الرياضيات",
                style: UITextStyle.titleBold
                    .copyWith(color: UIColors.primary, fontSize: 20),
              ),
            )),
        Positioned(
          left: 0,
          child: Container(
            width: 134,
            height: 42,
            decoration: const BoxDecoration(
                color:
                //examResult.exams[index].score < examResult.exams[index].minimum_score? UIColors.error :
                UIColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: const Row(
              children: [
                SizedBox(
                  width: 40.0,
                ),
                Text(
                  "100",
                  style: UITextStyle.titleBold,
                ),
                Text(
                  "/",
                  style: UITextStyle.titleBold,
                ),
                Text(
                  "50",
                  style: UITextStyle.titleBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
