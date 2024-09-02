import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/note.dart';
import '../../DataAccessLayer/Repositories/notes_repo.dart';

class NotesController extends GetxController{
  NotesRepo repo = NotesRepo();
  List<Note> notes = [];
  var loading = false.obs;
  final storage = GetStorage();
  late int sonId;

  @override
  void onInit() {
    super.onInit();
    sonId = Get.arguments['sonId'] ?? 0;  // تأكد من تعيين قيمة افتراضية إذا كان null
    if (sonId != 0) {
      getNotes();
    } else {
      print("Invalid sonId received.");
    } // استلام sonId كمعامل
    getNotes();
  }

  Future<void> getNotes() async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      notes = await repo.getNotes(token, sonId);
      print("notes: $notes");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}