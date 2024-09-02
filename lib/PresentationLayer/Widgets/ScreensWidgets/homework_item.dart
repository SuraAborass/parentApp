import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/homework.dart';
import '../../Screens/Public/view_image_screen.dart';

class HomeworkItem extends StatelessWidget {
  const HomeworkItem({super.key, required this.homework});
  final Homework homework;

  void _openFile(BuildContext context) async {
    if (homework.path.endsWith('.jpg') || homework.path.endsWith('.png')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewImageScreen(imageUrl: homework.path),
        ),
      );
    } else {
      final url = homework.path.startsWith('http') ? homework.path : 'file://${homework.path}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData = Icons.task;
    if (homework.path.endsWith('.jpg') || homework.path.endsWith('.png')) {
      iconData = Icons.image;
    } else if (homework.path.endsWith('.pdf')) {
      iconData = Icons.picture_as_pdf;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: homework.hasAttachment ? () => _openFile(context) : null,
        child: Container(
          width: 373,
          decoration: BoxDecoration(
            color: UIColors.homework,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Icon(
                  iconData,
                  color: UIColors.iconColor,
                  size: 40,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              homework.subjectName,
                              style: UITextStyle.titleBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        homework.description,
                        style: UITextStyle.titleBold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
