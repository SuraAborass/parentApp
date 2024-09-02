import 'package:flutter/material.dart';
import '../colors.dart';

class NoteState{
  static Color getNoteState(String noteState) {
    switch (noteState) {
      case "سلوك":
        return UIColors.error;
      case "ثناء":
        return UIColors.success;
      default:
        return UIColors.babyBlue;
    }
  }
}

class NoteStateIcon{
  static IconData getNoteState(String noteState) {
    switch (noteState) {
      case "سلوك":
        return Icons.sentiment_dissatisfied;
      case "ثناء":
        return Icons.sentiment_very_satisfied_outlined;
      default:
        return Icons.report_problem;
    }
  }
}