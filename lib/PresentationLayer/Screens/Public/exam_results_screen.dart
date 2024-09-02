import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/exam_result_item.dart';



class ExamResultsScreen extends StatelessWidget {
  const ExamResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("نتائج الامتحانات",
            style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: Get.height - 170,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return const ExamResultItem();
              },
            ),
          ),
        ),
      ),
    );
  }
}
