import 'package:bmi_buyer/data/network/data_agents/product_order/product_order_data_agent.dart';
import 'package:bmi_buyer/data/request_vo/product_order_request_vo.dart';
import 'package:bmi_buyer/data/response_vo/product_order_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../../api/api_service.dart';

class ProductOrderDataAgentImpl extends ProductOrderDataAgent {
  late ApiService _api;

  static final ProductOrderDataAgentImpl _singleton =
  ProductOrderDataAgentImpl._internal();

  factory ProductOrderDataAgentImpl() {
    return _singleton;
  }

  ProductOrderDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio,baseUrl: baseURL);
  }

  @override
  Future<ProductOrderResponseVo> productOrder(Orders orders, List<Product> products) {
    return _api.productOrder(orders, products);
  }






}