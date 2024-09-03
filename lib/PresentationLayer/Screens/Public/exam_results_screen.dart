import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/exam_result_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Clients/exam_result_client.dart';
import '../../../DataAccessLayer/Repositories/exam_result_repo.dart';
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
          padding: const EdgeInsets.only(top:10.0,bottom: 10,right: 14,left: 10),
          child: GetBuilder(
              init: controller,
              builder: (context) {
                return controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.studentMarks.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: controller.studentMarks.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ExamResultItem(
                          mark: controller.studentMarks[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد علامات!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
