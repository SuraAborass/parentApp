import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../DataAccessLayer/Models/fee.dart';


class FeeItem extends StatelessWidget {
  const FeeItem({super.key,required this.fee});
  final Fee fee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 373,
        decoration: BoxDecoration(
          color: UIColors.success,
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
              child: const Icon(FontAwesomeIcons.moneyBill,
                color: UIColors.white,
                size: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      fee.type,
                      style: UITextStyle.titleBold,
                    ),
                    Text(fee.date,
                      style: UITextStyle.titleBold,),
                    Text(fee.amountMoney.toString(),
                      style: UITextStyle.titleBold,),
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
