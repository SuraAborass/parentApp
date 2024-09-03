import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/HomeWidgets/attendance_item.dart';
import '../../Widgets/HomeWidgets/courses_item.dart';
import '../../Widgets/HomeWidgets/examResults_item.dart';
import '../../Widgets/HomeWidgets/homworks_item.dart';
import '../../Widgets/HomeWidgets/notes_item.dart';
import '../../Widgets/HomeWidgets/programs_item.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/Public/school_appbar.dart';
import '../../Widgets/HomeWidgets/advertisements_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStorage storage = GetStorage();

    // استرجاع معلومات الابن من GetStorage
    final int? sonId = storage.read('selectedSonId');
    final String? sonFirstName = storage.read('selectedSonFirstName');
    final String? sonLastName = storage.read('selectedSonLastName');
    final String? sonImage = storage.read('selectedSonImage');
    final String? sonClass = storage.read('selectedSonClass');
    final String? sonSection = storage.read('selectedSonSection');
    final String sonFullName = "${sonFirstName ?? "اسم"} ${sonLastName ?? "الابن"}";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(
          title: Text(
            "معهد النجاح",
            style: UITextStyle.titleBold.copyWith(fontSize: 22),
          ),
        ),
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        drawer: InstituteDrawer(),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: UIColors.primary,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    bottom: 0,
                    child: Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: UIColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 110,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: sonImage != null
                          ? NetworkImage(sonImage)
                          : AssetImage('assets/images/Mask Group 1.png') as ImageProvider,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sonFullName ?? "اسم الابن",
                          style: UITextStyle.titleBold
                              .copyWith(color: UIColors.purple, fontSize: 22),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            height: 48,
                            width: 330,
                            decoration: const BoxDecoration(
                                color: UIColors.primary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  "الصف: ${sonClass ?? "الصف"} - الشعبة: ${sonSection ?? "الشعبة"}",
                                  style: UITextStyle.bodyNormal.copyWith(
                                      fontSize: 16, color: UIColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  child: ListView(
                    children: [
                      Attendance(sonId: sonId),
                      HomeWorksItem(sonId: sonId),
                      CoursesItem(sonId: sonId),
                      ExamResults(sonId: sonId),
                      NotesItem(sonId: sonId),
                      ProgramsItem(sonId: sonId),
                      AdsItem()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
