import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/subjects_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/homework_item.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';

class HomeworksScreen extends StatelessWidget {
  HomeworksScreen({super.key});
  final SubjectsController subjectsController = Get.put(SubjectsController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map;
    final subjectId = args['subjectId'];
    final sonId = args['sonId'];

    // استدعاء الوظائف بناءً على subjectId و sonId
    subjectsController.getHomeworks(subjectId, sonId);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text(
            "الوظائف",
            style: UITextStyle.titleBold.copyWith(fontSize: 25),
          ),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<SubjectsController>(
            init: subjectsController,
            builder: (context) {
              return subjectsController.loading.value
                  ? SizedBox(
                height: Get.height - 250,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return const HomeworkShimmer();
                  },
                ),
              )
                  : RefreshIndicator(
                onRefresh: () async {
                  await subjectsController.getHomeworks(subjectId, sonId);
                },
                child: subjectsController.homeworks.isEmpty
                    ? SizedBox(
                  height: Get.height - 200,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "لايوجد وظائف!",
                          style: UITextStyle.titleBold.copyWith(
                              fontSize: 16,
                              color: UIColors.lightBlack),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: subjectsController.homeworks.length,
                  itemBuilder: (context, i) {
                    return HomeworkItem(
                      homework: subjectsController.homeworks[i],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
