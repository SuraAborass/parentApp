import 'package:get/get.dart';

import '../../DataAccessLayer/Models/advert.dart';
import '../../DataAccessLayer/Repositories/advertisiments_repo.dart';

class AdvertsController extends GetxController{
  AdvertsRepo repo = AdvertsRepo();
  List<Advert> ads = [];
  var loading = false.obs;


  @override
  void onInit() async{
    await getAdverts();
    super.onInit();

  }

  Future<void> getAdverts() async {
    loading.value = true;
    try {
      ads = await repo.getAdverts();
      if (ads.isEmpty) {
        print('No ads found.');
      } else {
        ads.forEach((ad) => print(ad.description)); // طباعة وصف كل إعلان
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      update();
      loading.value = false;
    }
  }
}