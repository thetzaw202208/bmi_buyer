import 'dart:math';

import 'package:bmi_buyer/const/img.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/screen/buying_process/buyer_goods_type.dart';
import 'package:bmi_buyer/screen/history/history.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../reusable_button.dart';

class BuyProcessSuccess extends StatefulWidget {
  const BuyProcessSuccess({super.key});

  @override
  State<BuyProcessSuccess> createState() => _BuyProcessSuccessState();
}

class _BuyProcessSuccessState extends State<BuyProcessSuccess> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                      true, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
              // Icon(
              //   Icons.check_circle,
              //   color: green,
              //   size: 180,
              // ),
              Image.asset(successImg,width: 150,height: 200,),
              const SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: const Center(
                        child: ReusableText(
                          reuseText:
                              "ဝယ်ယူမှု လုပ်ငန်းစဉ် အောင်မြင်ပါသည်။",
                          overflow: TextOverflow.visible,
                          fWeight: FontWeight.bold,
                          fSize: 16,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: const Center(
                        child: ReusableText(
                          reuseText: "အားပေးမှုအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။",
                          overflow: TextOverflow.visible,
                          fWeight: FontWeight.bold,
                          fSize: 16,
                        ),
                      ))
                ],
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ReusableButton(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    const HistoryScreen()), (Route<dynamic> route) => true);

              },
             // width: MediaQuery.of(context).size.width,
              text: "မှတ်တမ်းကြည့်ရန်",
              color: yellow,
              textColor: black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ReusableButton(

              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    const BuyerGoodsType()), (Route<dynamic> route) => true);
              },
              //width: MediaQuery.of(context).size.width,
              text: "ထပ်မံဝယ်ယူရန်",
              color: green,
              textColor: white,
            ),
          ),
        ],
      ),
    );
  }
}
