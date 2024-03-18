import 'package:bmi_buyer/data/network/data_agents/register/register_data_agent.dart';
import 'package:bmi_buyer/data/response_vo/register_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../api/api_service.dart';

class RegisterDataAgentImpl extends RegisterDataAgent {
  late ApiService _api;

  static final RegisterDataAgentImpl _singleton =
  RegisterDataAgentImpl._internal();

  factory RegisterDataAgentImpl() {
    return _singleton;
  }

  RegisterDataAgentImpl._internal() {
    final dio = Dio();
    _api = ApiService(dio);
  }

  @override
  Future<RegisterVo> doRegister(String name, String phoneNumber, String password, String address, int buyerCategory,String shopName,String shopAddress) {
    return _api.registerUser(name, phoneNumber, password, address, buyerCategory,shopName,shopAddress);
  }


}