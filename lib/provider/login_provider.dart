import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/data/network/data_agents/register/register_data_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/data_agents/login/login_data_agent.dart';
import '../data/network/data_agents/login/login_data_agent_impl.dart';
import '../screen/buying_process/buyer_goods_type.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginDataAgent loginDataAgent = LoginDataAgentImpl();

  bool loading = false;
  int? buyerID;
  String? phone, address, name;

  enableLoading() {
    loading = true;
    notifyListeners();
  }

  disableLoading() {
    loading = false;
    notifyListeners();
  }

  doLogin(String phoneNumber, String password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loginDataAgent.doLogin(phoneNumber, password).then((value) {
      if (value.code == 200) {
        buyerID = value.data?.id;
        name = value.data?.name;
        sharedPreferences.setInt("buyer_id", buyerID ?? 1);
        sharedPreferences.setString("name", name ?? "");
        sharedPreferences.setString("phone", phoneNumber);
        sharedPreferences.setString("address", value.data?.address ?? "");
        print("Login Data $name $phoneNumber ${value.data?.address}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BuyerGoodsType()),
            (Route<dynamic> route) => false);
        disableLoading();
      } else if (value.code == 422) {
        disableLoading();
        AwesomeDialog(
          dialogType: DialogType.error,
          context: context,
          title: value.message,
          btnOkOnPress: () {},
        ).show();
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
