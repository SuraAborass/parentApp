import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/advert.dart';
import '../../Screens/Public/view_image_screen.dart';

class AdvertItem extends StatelessWidget {
  const AdvertItem({super.key, required this.advert});
  final Advert advert;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            UIColors.gray.withOpacity(0.7),
            UIColors.lightBlack.withOpacity(0.7),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إعلان جديد',
            style: UITextStyle.titleBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'تم النشر: ${advert.createdAt}',
            style: UITextStyle.titleNormal,
          ),
          const SizedBox(height: 10),
          if (advert.image.isNotEmpty)
            Center(
              child: InkWell(
                onTap: (){
                  Get.to(() => ViewImageScreen(imageUrl: advert.image));
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(advert.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            advert.description,
            style: UITextStyle.titleNormal.copyWith(color: UIColors.primary),
          ),
        ],
      ),
    );
  }
}
