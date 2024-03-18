
import 'package:bmi_buyer/reusable_text.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.img, required this.text, required this.color});
final String img;
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(

        width: MediaQuery.of(context).size.width * .42,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: color,width: 5)),
        child: Column(

          children: [

            Image.asset(
             img,
              width: 100,
              height: 100,
            ),
            ReusableText(
              reuseText: text,
              fWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
