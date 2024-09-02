import'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/subjects_controller.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/subject_item.dart';


class SubjectsScreen extends StatelessWidget {
  SubjectsScreen({super.key});
  final SubjectsController subjectsController = Get.put(SubjectsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text("المواد", style: UITextStyle.titleBold.copyWith(fontSize: 25)),
        ),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
            init: subjectsController,
            builder: (context) {
              if (subjectsController.loading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  height: Get.height - 190,
                  child: GridView.builder(
                    itemCount: subjectsController.subjects.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return SubjectItem(subject: subjectsController.subjects[i]);
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

