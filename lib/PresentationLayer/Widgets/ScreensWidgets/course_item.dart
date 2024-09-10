import 'package:flutter/material.dart';
import '../../../Constants/Helpers/course_type.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/course.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 373,
        decoration: BoxDecoration(
          color: CourseType.getCourseType(course.type),
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
              child:  FittedBox(
                fit: BoxFit.contain, // يمكنك استخدام BoxFit.fill أو BoxFit.cover أيضًا
                child: Icon(
                  CourseTypeIcon.getCourseType(course.type),
                  color: UIColors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: UITextStyle.titleBold,
                    ),
                    Text(
                      course.description,
                      style: UITextStyle.titleBold,
                    ),
                    Text(
                      "التكلفة: ${course.cost}",
                      style: UITextStyle.titleBold,
                    ),
                    Text(
                      "${course.startDate} ${course.startTime}",
                      style: UITextStyle.titleBold,
                    ),
                    Text(
                      "المدرس: ${course.teacherFirstName} ${course.teacherLastName}",
                      style: UITextStyle.titleBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
