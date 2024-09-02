import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/son.dart';

class SonItem extends StatelessWidget {
  final Son son;
  final VoidCallback onTap; // تعريف onTap كـ Callback

  const SonItem({super.key, required this.son, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap, // استخدام onTap هنا
        child: Column(
          children: [
            CircleAvatar(
              radius: 75, // نصف القطر
              backgroundImage: NetworkImage(son.image,),
              backgroundColor: UIColors.primary,
              //AssetImage('assets/images/Mask Group 1.png'), // رابط الصورة الأولى
            ),
            const SizedBox(height: 10),
            Text(
              '${son.firstName} ${son.lastName}',
              style: UITextStyle.titleBold.copyWith(fontSize: 18, color: UIColors.primary),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
