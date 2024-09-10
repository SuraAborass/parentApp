import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/sumResult_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/sumMark_item.dart';


class SumResultScreen extends StatelessWidget {
  SumResultScreen({super.key});
  final SumResultController sumResultController = Get.put(SumResultController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            "المحصلة النهائية",
            style: UITextStyle.titleBold.copyWith(fontSize: 22),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 14, left: 10),
          child: GetBuilder<SumResultController>(
            init: sumResultController,
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: sumResultController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : sumResultController.studentResults.isNotEmpty
                        ? SizedBox(
                      height: Get.height - 190,
                      child: ListView.builder(
                        itemCount: sumResultController.studentResults.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return SumMarkItem(
                            studentResult: sumResultController.studentResults[i],
                          );
                        },
                      ),
                    )
                        : Center(
                      child: Text(
                        "لا يوجد محصّلات!",
                        style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    color: UIColors.iconColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "المحصلة النهائية:",
                          style: UITextStyle.titleBold.copyWith(fontSize: 22,color: UIColors.primary),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          // تحديد لون النص بناءً على النتيجة النهائية
                          Color resultColor = sumResultController.overAllResult.value == "Passed" ? UIColors.success : UIColors.error;
                          return Text(
                            sumResultController.overAllResult.value == "Passed" ? "ناجح" : "راسب",
                            style: UITextStyle.titleBold.copyWith(
                              fontSize: 22,
                              color: resultColor,
                              decoration: TextDecoration.underline,
                              decorationColor: resultColor,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
