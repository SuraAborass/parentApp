import 'package:flutter/material.dart';


import 'colors.dart';

class UITextStyle{
 static const titleBold = TextStyle(
      color: UIColors.white,
      fontSize: 18,
      fontFamily: "Hacen Tunisia Bd");

 static const bodyNormal = TextStyle(
  fontWeight: FontWeight.normal,
     color: UIColors.gray,
     fontSize: 14,
     fontFamily: "Hacen Tunisia Lt");

 static const smallBodyNormal = TextStyle(
     fontWeight: FontWeight.normal,
     color: UIColors.lightBlack,
     fontSize: 18,
     fontFamily: "Hacen Tunisia Lt");

 static const boldSmall = TextStyle(
     fontWeight: FontWeight.bold,
     color: UIColors.labelTextColor,
     fontSize: 16,
     fontFamily: "Hacen Tunisia Lt");
 static const normalSmall = TextStyle(
     fontWeight: FontWeight.normal,
     color: UIColors.labelTextColor,
     fontSize: 16,
     fontFamily: "Hacen Tunisia Lt");

 static const titleNormal = TextStyle(
     color: UIColors.white, fontSize: 18,
     fontFamily: "Hacen Tunisia LT");
}