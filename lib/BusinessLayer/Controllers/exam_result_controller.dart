import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/exam_result.dart';
import '../../DataAccessLayer/Repositories/exam_result_repo.dart';


class StudentMarkController extends GetxController {
   StudentMarkRepository repo = StudentMarkRepository();
   List<StudentMark> studentMarks = [];
 // var studentMarks = <StudentMark>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
   final storage = GetStorage();
   late int sonId;

   @override
   void onInit() {
     super.onInit();
     sonId = Get.arguments['sonId'] ?? 0;  // تأكد من تعيين قيمة افتراضية إذا كان null
     if (sonId != 0) {
       fetchMarks();
     } else {
       print("Invalid sonId received.");
     } // استلام sonId كمعامل
     fetchMarks();
   }
   Future<void> fetchMarks() async {
     isLoading.value = true;
     String? token = storage.read('userToken');
     if (token != null) {
       studentMarks = await repo.getStudentMarks(token, sonId);
       print("studentMarks: $studentMarks");
     } else {
       print("No token found!");
     }
     update();
     isLoading.value = false;
   }

}
