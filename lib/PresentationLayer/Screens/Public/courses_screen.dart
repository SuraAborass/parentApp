import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/courses_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/course_item.dart';


class CoursesScreen extends StatelessWidget {
  CoursesScreen({super.key});
  final CoursesController coursesController = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("الدورات",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: coursesController,
              builder: (context) {
                return coursesController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : coursesController.courses.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: coursesController.courses.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CourseItem(
                          course: coursesController.courses[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد دورات مسجل فيها!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
