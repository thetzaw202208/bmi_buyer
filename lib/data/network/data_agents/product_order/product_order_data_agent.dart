import 'package:bmi_buyer/data/response_vo/product_order_response_vo.dart';

import '../../../request_vo/product_order_request_vo.dart';

abstract class ProductOrderDataAgent {
  Future<ProductOrderResponseVo> productOrder(
      Orders orders, List<Product> products);
}
