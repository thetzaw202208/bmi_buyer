import 'package:bmi_buyer/data/response_vo/register_response_vo.dart';

abstract class RegisterDataAgent {
  Future<RegisterVo> doRegister(
      String name, String phoneNumber, String password,String address,int buyerCategory,String shopName,String shopAddress);
}
