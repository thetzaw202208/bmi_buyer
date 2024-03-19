import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/const/color.dart';
import 'package:bmi_buyer/provider/register_provider.dart';
import 'package:bmi_buyer/reusable_button.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/reusable_textField.dart';
import 'package:bmi_buyer/screen/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/dimen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.buyerType});
  final int buyerType;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (context) => RegisterProvider(),
      child: Scaffold(
        backgroundColor: white.withOpacity(0.95),
        body: Consumer<RegisterProvider>(
          builder: (context, registerProvider, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: ListView(
              children: [
                Image.asset(
                  "assets/images/KB_Rice_Logo-01.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 0,
                ),
                ReusableTextField(
                  hintText: "အမည်ထည့်ပါ",
                  textEditingController: registerProvider.nameController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextField(
                  prefixText: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ReusableText(reuseText: "09",fSize: 16,fWeight: FontWeight.w400,),
                  ),
                  hintText: "ဖုန်းနံပါတ်ထည့်ပါ",
                  keyboardType: TextInputType.phone,
                  textEditingController: registerProvider.phoneController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.phone)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextField(
                  hintText: "လျှို့ဝှက်နံပါတ်ထည့်ပါ",
                  obs: true,
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: registerProvider.passwordController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextField(
                  hintText: "လိပ်စာထည့်ပါ",
                  textEditingController: registerProvider.addressController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon: const Opacity(
                      opacity: 0.5, child: Icon(Icons.location_on_rounded)),
                ),
                if (buyerType == 2)
                  const SizedBox(
                    height: 20,
                  ),
                if (buyerType == 2)
                  ReusableTextField(
                    hintText: "ဆိုင်အမည်ထည့်ပါ",
                    textEditingController: registerProvider.shopNameController,
                    borderColor: kLoginBorderColor,
                    borderRadius: kLargeBorderRadius,
                    prefixIcon: const Opacity(
                        opacity: 0.5, child: Icon(Icons.shopping_basket)),
                  ),
                if (buyerType == 2)
                  const SizedBox(
                    height: 20,
                  ),
                if (buyerType == 2)
                  ReusableTextField(
                    hintText: "ဆိုင်လိပ်စာထည့်ပါ",
                    textEditingController:
                        registerProvider.shopAddressController,
                    borderColor: kLoginBorderColor,
                    borderRadius: kLargeBorderRadius,
                    prefixIcon: const Opacity(
                        opacity: 0.5, child: Icon(Icons.location_on_rounded)),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  widget: registerProvider.loading
                      ? const Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: white,
                              )),
                        )
                      : const ReusableText(
                          reuseText: "အကောင့်လုပ်မည်",
                          fColor: white,
                        ),
                  onTap: () async {
                    if (registerProvider.nameController.text.isNotEmpty &&
                        registerProvider.phoneController.text.isNotEmpty &&
                        registerProvider.passwordController.text.isNotEmpty &&
                        registerProvider.addressController.text.isNotEmpty) {
                      if(registerProvider.passwordController.text.length<6){
                        AwesomeDialog(
                          dialogType: DialogType.warning,
                          context: context,
                          btnOkText: "အိုကေ",
                          desc: "လျှို့ဝှက်နံပါတ် အနည်းဆုံး ၆ လုံးရှိရပါမည်",
                          btnOkOnPress: () {

                          },
                        )
                            .show();
                      }else{
                        registerProvider.enableLoading();
                        registerProvider.doRegister(
                            registerProvider.nameController.text,
                            registerProvider.phoneController.text,
                            registerProvider.passwordController.text,
                            registerProvider.addressController.text,
                            buyerType,
                            registerProvider.shopNameController.text,
                            registerProvider.shopAddressController.text,
                            context);
                        if (kDebugMode) {
                          print("Here is buyer type $buyerType");
                        }
                      }

                    }else{
                      AwesomeDialog(
                          dialogType: DialogType.warning,
                          context: context,
                        btnOkText: "အိုကေ",
                           desc: "အချက်အလက်များ ပြည့်စုံစွာဖြည့်သွင်းပါ",
                          btnOkOnPress: () {

                          },
                          )
                          .show();
                    }

                  },
                  width: MediaQuery.of(context).size.width,
                  text: "",
                  color: green,
                  textColor: white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Opacity(
                        opacity: 0.6,
                        child: ReusableText(reuseText: "အကောင့်ရှိလား?")),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (context.mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      },
                      child: Opacity(
                          opacity: 0.6,
                          child: ReusableText(
                            reuseText: "ဝင်မည်",
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
