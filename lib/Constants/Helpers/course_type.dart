import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';


class CourseType{
  static Color getCourseType(int courseType) {
    switch (courseType) {
      case 10:
        return UIColors.yellow;
      case 11:
        return UIColors.success;
      default:
        return UIColors.error;
    }
  }
}

class CourseTypeIcon{
  static IconData getCourseType(int courseType) {
    switch (courseType) {
      case 10:
        return Icons.pending_actions;
      case 11:
        return Icons.done;
      default:
        return Icons.cancel;
    }
  }
}