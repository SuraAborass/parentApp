import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/sumMark.dart';
import '../../DataAccessLayer/Repositories/sumMark_repo.dart';

class SumResultController extends GetxController{
  SumMarkRepository repo = SumMarkRepository();
  List<StudentResult> studentResults = [];
  var isLoading = true.obs;
  var error = ''.obs;
  final storage = GetStorage();
  late int sonId;
  var overAllResult = ''.obs;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;
    if (sonId != 0) {
      fetchSumMarks();
    } else {
      print("Invalid sonId received.");
    }
  }
  Future<void> fetchSumMarks() async {
    isLoading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      studentResults = await repo.fetchSumMarks(token,sonId);
      print("studentResults: $studentResults");
    } else {
      print("No token found!");
    }
    update();
    isLoading.value = false;
  }
}