import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Constants/colors.dart';
import '../../DataAccessLayer/Models/absence.dart';
import '../../DataAccessLayer/Repositories/absence_repo.dart';
import '../../PresentationLayer/Widgets/Public/snackbars.dart';

class AbsencesController extends GetxController {
  AbsencesRepo repo = AbsencesRepo();
  List<Absence> absences = [];
  var loading = false.obs;
  final storage = GetStorage();
  late int sonId;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;
    if (sonId != 0) {
      getAbsences();
    } else {
      print("Invalid sonId received.");
    }
  }

  Future<void> getAbsences() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      absences = await repo.getAbsences(token, sonId);
      print("absences: $absences");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

  Future<void> justifyAbsence(BuildContext context, int absenceId, String justification) async {
    String? token = storage.read('userToken');
    if (token == null) {
      Get.snackbar('Error', 'User token is missing.');
      return;
    }

    try {
      bool success = await repo.justifyAbsence(absenceId, token, justification);
      if (success) {
        // تحديث حالة الغياب بالتبرير المرسل
        absences.firstWhere((absence) => absence.id == absenceId).justification = justification;

        Get.back(); // إغلاق الـ Dialog بعد النجاح
        SnackBars.showSuccess( 'تم إرسال التبرير بنجاح');
        update(); // تحديث واجهة المستخدم لتغيير زر التبرير إلى "تم التبرير"
      } else {
        SnackBars.showError( 'فشل إرسال التبرير',);
      }
    } catch (e) {
      SnackBars.showError( 'حدث خطأ أثناء التبرير');
    }
  }



}
