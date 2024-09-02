import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/absences_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/absence_item.dart';

class AbsencesScreen extends StatelessWidget {
   AbsencesScreen({super.key});
  final AbsencesController absencesController = Get.put(AbsencesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
            title: Text("الغيابات",
                style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: absencesController,
              builder: (context) {

                  return absencesController.loading.value
                        ? Center(child: CircularProgressIndicator())
                        : absencesController.absences.isNotEmpty
                        ? SizedBox(
                          child: ListView.builder(
                                                itemCount: absencesController.absences.length,
                                                physics: const BouncingScrollPhysics(),
                                                itemBuilder: (context, i) {
                          return AbsenceItem(
                              absence: absencesController.absences[i]);
                                                },
                                              ),
                        )
                        : Center(
                      child: Text("لا يوجد غيابات غير مبررة!",
                        style: UITextStyle.titleBold.copyWith(
                            color: UIColors.black),),
                    );

              }),
        ),
      ),
    );
  }
}
