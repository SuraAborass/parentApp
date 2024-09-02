import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/program.dart';
import '../../DataAccessLayer/Repositories/programs_repo.dart';

class ProgramController extends GetxController {
  ProgramsRepo repo = ProgramsRepo();
  List<Program> programs = [];
  var loading = false.obs;
  final storage = GetStorage();
  late int sonId;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;  // تأكد من تعيين قيمة افتراضية إذا كان null
    if (sonId != 0) {
      getPrograms();
    } else {
      print("Invalid sonId received.");
    } // استلام sonId كمعامل
    getPrograms();
  }

  Future<void> getPrograms() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      programs = await repo.getPrograms(token, sonId);
      print("programs: $programs");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}
