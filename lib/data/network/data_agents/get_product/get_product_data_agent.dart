import 'package:bmi_buyer/data/response_vo/get_product_response_vo.dart';

abstract class GetProductDataAgent {
  Future<GetProductResponseVo> getProduct(
      int buyerID);
}
