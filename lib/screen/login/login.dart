import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/const/color.dart';
import 'package:bmi_buyer/provider/login_provider.dart';
import 'package:bmi_buyer/reusable_button.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/reusable_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/dimen.dart';
import '../buyer_type_select/buyer_type.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: white.withOpacity(0.95),
        body: Consumer<LoginProvider>(
          builder: (context, loginProvider, _) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Image.asset(
                  "assets/images/KB_Rice_Logo-01.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  hintText: "ဖုန်းနံပါတ်ထည့်ပါ",
                  keyboardType: TextInputType.phone,
                  textEditingController: loginProvider.phoneController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      const Opacity(opacity: 0.5, child: Icon(Icons.phone)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableText(
                          reuseText: "09",
                          fSize: 16,
                          fWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  hintText: "လျှို့ဝှက်နံပါတ်ထည့်ပါ",
                  obs: true,
                  textEditingController: loginProvider.passwordController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 5,
                ),
                // const Align(
                //     alignment: Alignment.bottomRight,
                //     child: Opacity(
                //         opacity: 0.6,
                //         child: ReusableText(
                //             reuseText: "လျှို့ဝှက်နံပါတ်မေ့နေသလား?"))),
                const SizedBox(
                  height: 30,
                ),
                IgnorePointer(
                  ignoring: loginProvider.loading,
                  child: ReusableButton(
                    onTap: () async {
                      if (loginProvider.phoneController.text.isNotEmpty &&
                          loginProvider.passwordController.text.isNotEmpty) {
                        loginProvider.enableLoading();
                        Future.delayed(const Duration(seconds: 2),(){
                          loginProvider.doLogin(loginProvider.phoneController.text,
                              loginProvider.passwordController.text, context);
                        });

                      } else {
                        AwesomeDialog(
                          dialogType: DialogType.warning,
                          context: context,
                          btnOkText: "အိုကေ",
                          desc: "အချက်အလက်များ ပြည့်စုံစွာဖြည့်သွင်းပါ",
                          btnOkOnPress: () {},
                        ).show();
                      }
                    },
                    width: MediaQuery.of(context).size.width,
                    text: "",
                    widget: loginProvider.loading
                        ? const Center(
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: white,
                                )),
                          )
                        : const ReusableText(
                            reuseText: "အကောင့်ဝင်မည်",
                            fColor: white,
                          ),
                    color:loginProvider.loading?green.withOpacity(0.5): green,
                    textColor: white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Opacity(
                        opacity: 0.6,
                        child: ReusableText(reuseText: "အကောင့်မရှိဘူးလား?")),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const BuyerType()),
                            (Route<dynamic> route) => false);
                      },
                      child: Opacity(
                          opacity: 0.6,
                          child: ReusableText(
                            reuseText: "အသစ်လုပ်မည်",
                            fColor: green.withOpacity(1),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
