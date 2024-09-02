import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';


PreferredSizeWidget schoolAppBar(
    {Widget? leading, List<Widget> actions = const [],title,backgroundColor}) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title:  Text("Schoolify",style: UITextStyle.bodyNormal.copyWith(color: UIColors.white,fontSize: 22)),
    backgroundColor: UIColors.purple,
    leading:   Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.dehaze_outlined,
            size: 30,
            color: UIColors.white,
          ));
    }),
  );
}