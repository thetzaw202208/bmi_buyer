
import 'package:bmi_buyer/const/string.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/screen/history/history.dart';
import 'package:bmi_buyer/screen/login/login.dart';
import 'package:bmi_buyer/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'const/color.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.scaffoldChild});
final Scaffold scaffoldChild;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
final advancedDrawerController = AdvancedDrawerController();


class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: white,
          iconColor: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 200.0,
                height: 158.0,
                padding: const EdgeInsets.only(left: 15),
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  // color: Colors.black26,
                  shape: BoxShape.rectangle,
                ),
                child: Image.asset(
                  'assets/images/KB_Rice_Logo-01.png'
                ),
              ),

              ListTile(
                onTap: () {
                  advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.shopping_cart),
                title: const ReusableText(reuseText: 'ဝယ်ယူမည်',fWeight: FontWeight.bold,fColor: white,),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const ProfileScreen()), (Route<dynamic> route) => true);
                  advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: const ReusableText(reuseText: 'ပရိုဖိုင်',fWeight: FontWeight.bold,fColor: white),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const HistoryScreen()), (Route<dynamic> route) => true);
                  advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.history),
                title: const ReusableText(reuseText:'ဝယ်ယူမှုမှတ်တမ်း',fWeight: FontWeight.bold,fColor: white),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  const LoginScreen()), (Route<dynamic> route) => false);
                  advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.logout_outlined),
                title: const ReusableText(reuseText:'အကောင့်မှ ထွက်မည်',fWeight: FontWeight.bold,fColor: white),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,horizontal: 10
                  ),
                  child: Row(
                    children: [
                      const ReusableText(reuseText:'Current App Version',fColor: black,),
                      const ReusableText(reuseText:'  $version ( $buildNumber )',fColor: black,fSize: 16,fWeight: FontWeight.w600,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ Colors.green.withOpacity(0.5),Colors.grey.withOpacity(0.5),],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child:widget.scaffoldChild,
    );
  }
}
