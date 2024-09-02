import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/Controllers/notes_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/Drawer.dart';
import '../../Widgets/Public/bottom_navigation.dart';
import '../../Widgets/Public/institute_appbar.dart';
import '../../Widgets/ScreensWidgets/note_item.dart';

class NotesScreen extends StatelessWidget {
   NotesScreen({super.key});
  final NotesController notesController = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: const InstituteBottomNavigationBar(),
        appBar: instituteAppBar(title: Text("الملاحظات",style: UITextStyle.titleBold.copyWith(fontSize: 25))),
        drawer:  InstituteDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder(
              init: notesController,
              builder: (context) {
                return notesController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : notesController.notes.isNotEmpty
                    ? SizedBox(
                  height: Get.height - 190,
                  child: ListView.builder(
                    itemCount: notesController.notes.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return NoteItem(
                          note: notesController.notes[i]);
                    },
                  ),
                )
                    : Center(
                  child: Text("لا يوجد ملاحظات!",
                    style: UITextStyle.titleBold.copyWith(color: UIColors.black),),
                );
              }
          ),
        ),
      ),
    );
  }
}
