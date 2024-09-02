import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/son.dart';
import '../../DataAccessLayer/Repositories/sons_repo.dart';

class SonsController extends GetxController{

  SonsRepo repo = SonsRepo();
  List<Son> sons = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSons();
  }

  Future<void> getSons() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      sons = await repo.getSons(token);
      print("sons: $sons");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}