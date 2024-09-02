import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

//border styles
const radiusbottomright = BorderRadius.only(bottomRight: Radius.circular(45));
const radiustopleftandright = BorderRadius.only(topLeft: Radius.circular(45),topRight:  Radius.circular(45));


//text field styles
final profileInputStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.circleAvatarBackground,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  hintStyle: const TextStyle(
    color: UIColors.darkNormalText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  ),
);

//button styles
final profileButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.primary),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      side: const BorderSide(width: 1, color: UIColors.white),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll<Size>(
    Size(double.infinity, 56),
  ),
);

final textFieldStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: UIColors.primary,
    ),
    borderRadius: BorderRadius.circular(15),
  ),
  //hintStyle: UITextStyle.normalSmall
);