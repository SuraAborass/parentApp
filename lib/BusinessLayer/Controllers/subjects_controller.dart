import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/homework.dart';
import '../../DataAccessLayer/Models/subject.dart';
import '../../DataAccessLayer/Repositories/subjects_repo.dart';


class SubjectsController extends GetxController {
  SubjectsRepo repo = SubjectsRepo();
  List<Subject> subjects = [];
  List<Homework> homeworks = [];
  var loading = false.obs;
  late int sonId;
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;  // تأكد من تعيين قيمة افتراضية إذا كان null
    if (sonId != 0) {
      getSubjects();
    } else {
      print("Invalid sonId received.");
    } // استلام sonId كمعامل
    getSubjects();
  }

  Future<void> getSubjects() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      subjects = await repo.getSubjects(token, sonId);
      print("subjects: $subjects");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

  Future<void> getHomeworks(int subjectId, int sonId) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    if (token != null) {
      homeworks = await repo.getHomeworks(subjectId, sonId, token);
    }
    update();
    loading.value = false;
  }

}

