import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/Controllers/fees_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/fee_item.dart';
import '../../Widgets/Shimmers/homework_shimmer.dart';


class FeesScreen extends StatelessWidget {
  FeesScreen({super.key});
  final FeesController feesController = Get.put(FeesController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(
          title: Text("الأقساط", style: UITextStyle.titleBold.copyWith(fontSize: 25)),
        ),
        drawer: InstituteDrawer(),
        body: GetBuilder<FeesController>(
          init: feesController,
          builder: (context) {
            return Column(
              children: [
                Expanded(
                  child: feesController.loading.value
                      ? const Center(child: CircularProgressIndicator())
                      : feesController.fees.isEmpty
                      ? Center(
                    child: Text(
                      "لا يوجد مدفوعات!",
                      style: UITextStyle.titleBold.copyWith(color: UIColors.black),
                    ),
                  )
                      : RefreshIndicator(
                    onRefresh: feesController.getFees,
                    child: ListView.builder(
                      itemCount: feesController.fees.length,
                      itemBuilder: (context, i) {
                        return FeeItem(
                          fee: feesController.fees[i],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  color: UIColors.remainingAmount,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "المبلغ الباقي:",
                        style: UITextStyle.titleBold.copyWith(fontSize: 22),
                      ),
                      const SizedBox(width: 10),
                      Obx(() => Text(
                        feesController.netValue.value.toString(),
                        style: UITextStyle.titleBold.copyWith(fontSize: 22),
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

