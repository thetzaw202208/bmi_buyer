

import 'package:bmi_buyer/data/response_vo/get_product_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../../api/api_service.dart';
import 'get_product_data_agent.dart';

class GetProductDataAgentImpl extends GetProductDataAgent {
  late ApiService _api;

  static final GetProductDataAgentImpl _singleton =
  GetProductDataAgentImpl._internal();

  factory GetProductDataAgentImpl() {
    return _singleton;
  }

  GetProductDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio);
  }

  @override
  Future<GetProductResponseVo> getProduct(int buyerID) {
   return _api.getProduct(buyerID);
  }






}