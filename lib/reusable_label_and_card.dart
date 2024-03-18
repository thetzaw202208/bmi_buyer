
import 'package:bmi_buyer/reusable_text.dart';
import 'package:flutter/material.dart';

import 'const/color.dart';
import 'data/static_data/rice_name_model/rice_name.dart';

class ReusableLabelAndCard extends StatelessWidget {
  const ReusableLabelAndCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgPath, required this.onTap,
  });
  final String title;
  final String subTitle;
  final List<Rice> imgPath;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 206,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  reuseText: title,
                  fWeight: FontWeight.bold,
                  fColor: black,
                ),
                ReusableText(
                  reuseText: subTitle,
                  fWeight: FontWeight.bold,
                  fColor: black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: 179,
            child: ListView.builder(
                padding: const EdgeInsets.only(right: 10),
                scrollDirection: Axis.horizontal,
                itemCount: imgPath.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color:black.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 155,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            imgPath[index].imagePath))),
                              ),
                              ReusableText(
                                reuseText: imgPath[index].price,
                                fColor: black,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
