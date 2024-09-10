import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/exam_result_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/exam_result_item.dart';


class ExamResultsScreen extends StatelessWidget {
  final StudentMarkController controller = Get.put(StudentMarkController());

  ExamResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            "نتائج الامتحانات",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 14, left: 10),
          child: GetBuilder<StudentMarkController>(
            init: controller,
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.studentMarks.isNotEmpty
                        ? SizedBox(
                      height: Get.height - 190,
                      child: ListView.builder(
                        itemCount: 1, // عرض عنصر واحد لأننا سنمرر جميع العلامات في مرة واحدة
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          // تمرير قائمة العلامات كاملةً إلى ExamResultItem
                          return ExamResultItem(
                            marks: controller.studentMarks,
                          );
                        },
                      ),
                    )
                        : Center(
                      child: Text(
                        "لا يوجد علامات!",
                        style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.sumResult,
                          arguments: {'sonId': controller.sonId});
                    },
                    child: Container(
                      width: Get.width,
                      color: UIColors.yellow,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save,color: UIColors.white,size: 30,),
                          SizedBox(width: 10,),
                          Text(
                            "المحصّلات",
                            style: UITextStyle.titleBold.copyWith(fontSize: 25),
                          ),
                        ],
                      ),
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
