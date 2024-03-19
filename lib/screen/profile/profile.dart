import 'package:bmi_buyer/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/color.dart';
import '../../const/dimen.dart';
import '../../reusable_textField.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController buyer=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name.text = sharedPreferences.getString("name") ?? "";
    phone.text = sharedPreferences.getString("phone") ?? "";
    address.text = sharedPreferences.getString("address") ?? "";
    var buyerType = sharedPreferences.getInt("buyer_id");
    if(buyerType==1){
      buyer.text="လက်လီ";
    }
    else{
      buyer.text="လက်ကား";
    }
    print("Profile Data $name $phone $address");
    setState(() {

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    phone.dispose();
    address.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ပရိုဖိုင်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(Icons.person,size: 100,),
              ),
            ),
            const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(reuseText: "အမည်",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(
                  isEnabled: false,
                  textEditingController: name,

                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            const SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(reuseText: "ဖုန်းနံပါတ်",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  textEditingController: phone,
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            const SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(reuseText: "လိပ်စာ",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  textEditingController: address,
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            const SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(reuseText: "ဝယ်ယူသူ အမျိုးအစား",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  textEditingController: buyer,
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            const SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}
