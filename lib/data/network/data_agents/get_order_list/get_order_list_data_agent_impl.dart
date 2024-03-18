

import 'package:bmi_buyer/data/network/data_agents/get_order_list/get_order_list_data_agent.dart';
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../api/api_service.dart';

class GetOrderListDataAgentImpl extends GetOrderListDataAgent {
  late ApiService _api;

  static final GetOrderListDataAgentImpl _singleton =
  GetOrderListDataAgentImpl._internal();

  factory GetOrderListDataAgentImpl() {
    return _singleton;
  }

  GetOrderListDataAgentImpl._internal() {
    final dio = Dio();
    _api = ApiService(dio);
  }

  @override
  Future<OrderListResponseVo> getOrderList(int buyerID) {
    return _api.getProductOrderList(buyerID);
  }








}