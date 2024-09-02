import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/programs_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/program_item.dart';

class ProgramsScreen extends StatelessWidget {
   ProgramsScreen({super.key});
  final ProgramController programController = Get.put(ProgramController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("البرامج",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: programController,
              builder: (context) {
                return programController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : programController.programs.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: programController.programs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return ProgramItem(
                          program: programController.programs[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد برنامج!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
