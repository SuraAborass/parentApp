import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/advertsController.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/advertItem.dart';

class AdvertsScreen extends StatelessWidget {
   AdvertsScreen({super.key});
  final AdvertsController advertsController = Get.put(AdvertsController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
            title: Text("الإعلانات",
                style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer: InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: advertsController,
              builder: (context) {
                if (advertsController.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: advertsController.ads.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return AdvertItem(advert: advertsController.ads[i]);
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}
