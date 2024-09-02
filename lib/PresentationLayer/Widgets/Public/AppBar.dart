import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';

PreferredSizeWidget mainAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: UIColors.primary,
    elevation: 0.0,
    title: const Text(
      "معهد النجاح",
      style: UITextStyle.boldSmall,
    ),
    centerTitle: true,
     // flexibleSpace: Container(decoration: const BoxDecoration(
     //     image:DecorationImage(image: AssetImage('assets/images/logo.png'),fit: BoxFit.cover,opacity: 205)),),
    leading: Builder(builder: (context) {
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
    actions:  [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            width: 50,
              height: 150,
            child: Image.asset(
              'assets/images/logo.png',fit: BoxFit.cover,
            ),
          ),
        ),
      )
    ],
  );
}