import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../BusinessLayer/Controllers/sons_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/son_item.dart';

class SonsScreen extends StatelessWidget {
  SonsScreen({super.key});
  final SonsController sonsController = Get.put(SonsController());
  final GetStorage storage = GetStorage(); // إنشاء GetStorage instance

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: instituteAppBar(
          title: Text(
            "الأبناء",
            style: UITextStyle.titleBold.copyWith(fontSize: 22),
          ),
        ),
        backgroundColor: UIColors.primary,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "اختر حساب الابن الذي تريد الاطّلاع على معلوماته",
                  style: UITextStyle.titleBold.copyWith(fontSize: 22),
                  textAlign: TextAlign.center, // النص يتوسط الشاشة
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: UIColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                width: double.infinity, // لتغطية عرض الشاشة بالكامل
                child: GetBuilder(
                    init: sonsController,
                    builder: (context) {
                      return SizedBox(
                        height: Get.height - 190,
                        child: ListView.builder(
                          itemCount: sonsController.sons.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return SonItem(
                                son: sonsController.sons[i],
                                onTap: () {
                                  // تخزين معلومات الابن المختار في GetStorage
                                  storage.write('selectedSonId', sonsController.sons[i].id);
                                  storage.write('selectedSonFirstName', sonsController.sons[i].firstName);
                                  storage.write('selectedSonLastName', sonsController.sons[i].lastName);
                                  storage.write('selectedSonImage', sonsController.sons[i].image);
                                  storage.write('selectedSonClass', sonsController.sons[i].grade);
                                  storage.write('selectedSonSection', sonsController.sons[i].section);
                                  int selectedSonId = sonsController.sons[i].id;
                                  print('Selected Son ID: $selectedSonId');

                                  // الانتقال إلى الصفحة الرئيسية
                                  Get.toNamed(AppRoutes.homeScreen);
                                }
                            );
                          },
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
