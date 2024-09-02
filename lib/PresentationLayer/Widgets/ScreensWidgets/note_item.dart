import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Helpers/note_state.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key,required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 373,
        decoration: BoxDecoration(
          color: NoteState.getNoteState(note.type),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 66,
              height: 64,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Icon(
                NoteStateIcon.getNoteState(note.type),
                color: UIColors.white,
                size: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  note.text,
                  style: UITextStyle.titleBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
