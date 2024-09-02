import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';

Widget pageTitle(title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: UITextStyle.bodyNormal.copyWith(color: UIColors.pageTitle,fontSize: 20),
        ),
      ],
    ),
  );
}
