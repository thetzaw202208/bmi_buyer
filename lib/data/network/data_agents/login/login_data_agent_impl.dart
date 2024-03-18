
import 'package:bmi_buyer/data/response_vo/login_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../api/api_service.dart';
import 'login_data_agent.dart';

class LoginDataAgentImpl extends LoginDataAgent {
  late ApiService _api;

  static final LoginDataAgentImpl _singleton =
  LoginDataAgentImpl._internal();

  factory LoginDataAgentImpl() {
    return _singleton;
  }

  LoginDataAgentImpl._internal() {
    final dio = Dio();
    _api = ApiService(dio);
  }

  @override
  Future<LoginResponseVo> doLogin(String phoneNumber, String password) {
   return _api.login(phoneNumber, password);
  }




}