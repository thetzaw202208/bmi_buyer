
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';

abstract class GetOrderListDataAgent {
  Future<OrderListResponseVo> getOrderList(
      int buyerID);
}
