import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../Constants/text_styles.dart';
import '../../Widgets/Public/institute_appbar.dart';
class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: instituteAppBar(title: Text("عرض الصورة",
          style: UITextStyle.titleBold.copyWith(fontSize: 25))),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
