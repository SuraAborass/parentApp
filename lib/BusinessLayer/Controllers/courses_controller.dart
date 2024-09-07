import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/course.dart';
import '../../DataAccessLayer/Repositories/courses_repo.dart';



class CoursesController extends GetxController{
  CoursesRepo repo = CoursesRepo();
  List<Course> courses = [];
  var loading = false.obs;
  final storage = GetStorage();
  late int sonId;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;  // تأكد من تعيين قيمة افتراضية إذا كان null
    if (sonId != 0) {
      getCourses();
    } else {
      print("Invalid sonId received.");
    } // استلام sonId كمعامل
    getCourses();
  }

  Future<void> getCourses() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      // احصل على جميع الدورات
      List<Course> allCourses = await repo.getCourses(token, sonId);
      // قم بتصفية الدورات التي يكون فيها type يساوي 10
      courses = allCourses.where((course) => course.type == 10).toList();
      print("filtered courses: $courses");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

}