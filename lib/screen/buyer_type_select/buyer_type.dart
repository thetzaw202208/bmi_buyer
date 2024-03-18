import 'package:bmi_buyer/screen/buying_process/buyer_goods_type.dart';
import 'package:bmi_buyer/screen/history/history.dart';
import 'package:bmi_buyer/screen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../const/color.dart';
import '../../const/dimen.dart';
import '../../custom_drawer.dart';
import '../../reusable_button.dart';
import '../../reusable_text.dart';

class BuyerType extends StatefulWidget {
  const BuyerType({super.key});

  @override
  State<BuyerType> createState() => _BuyerTypeState();
}

class _BuyerTypeState extends State<BuyerType> {
  List<String> sellerType = [
    "လက်လီ",
    "လက်ကား",
  ];
  String? errorText;
  int? selectedIndex = 0;
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: GestureDetector(
          //   onTap: _handleMenuButtonPressed,
          //   child: ValueListenableBuilder<AdvancedDrawerValue>(
          //     valueListenable: advancedDrawerController,
          //     builder: (_, value, __) {
          //       return AnimatedSwitcher(
          //         duration: const Duration(milliseconds: 250),
          //         child: Icon(
          //           value.visible ? Icons.clear : Icons.menu,
          //           key: ValueKey<bool>(value.visible),
          //         ),
          //       );
          //     },
          //   ),
          // ),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ReusableText(
                reuseText: "ကျေးဇူးပြု၍ ရွေးချယ်ပါ",
                fWeight: FontWeight.bold,
                fSize: kFontSize20,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  itemCount: sellerType.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          errorText = "";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: selectedIndex == index
                                ? yellow
                                : black.withOpacity(0.1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10),
                              child: Image.asset(
                                index == 0
                                    ? "assets/images/retail.gif"
                                    : "assets/images/wholesale.gif",
                              ),
                            ),
                            ReusableText(
                              reuseText: sellerType[index],
                              fWeight: FontWeight.bold,
                              fSize: kFontSize13,
                              fColor: black,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            //if (errorText != "")
            Center(
                child: ReusableText(
              reuseText: errorText,
              fColor: Colors.red,
            )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: ReusableButton(
            onTap: () async {
              // SharedPreferences sh=await SharedPreferences.getInstance();
              // sh.setInt("userType", selectedIndex??0);
              if (selectedIndex != null) {
                errorText = "";
                if (context.mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  RegisterScreen(buyerType: (selectedIndex??0)+1,)));
                }
              } else {
                setState(() {});
                errorText = "ကျေးဇူးပြု၍ အနည်းဆုံး တစ်ခုရွေးပေးပါ";
              }
            },
            width: MediaQuery.of(context).size.width,
            text: "ဆက်သွားမည်",
            color: green,
            textColor: white,
          ),
        ),
      )
    ;
  }
}
