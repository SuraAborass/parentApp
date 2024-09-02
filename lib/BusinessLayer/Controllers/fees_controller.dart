import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/fee.dart';
import '../../DataAccessLayer/Repositories/fees_repo.dart';

class FeesController extends GetxController {
  FeesRepo repo = FeesRepo();
  List<Fee> fees = [];
  var loading = false.obs;
  final storage = GetStorage();
  late int sonId;
  var netValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;
    if (sonId != 0) {
      getFees();
    } else {
      print("Invalid sonId received.");
    }
  }

  Future<void> getFees() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      fees = await repo.getFees(token, sonId);
      if (fees.isNotEmpty) {
        // تحديث قيمة المبلغ الباقي بناءً على آخر قيمة مستلمة
        netValue.value = fees.last.remainingFee;
      }
    } else {
      print("No token found!");
    }
    loading.value = false;
    update();
  }
}
