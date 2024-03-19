import 'package:bmi_buyer/data/response_vo/get_product_response_vo.dart';
import 'package:bmi_buyer/data/response_vo/login_response_vo.dart';
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';
import 'package:bmi_buyer/data/response_vo/product_order_response_vo.dart';
import 'package:bmi_buyer/data/response_vo/register_response_vo.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../const/api.dart';
import '../request_vo/product_order_request_vo.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  ///Register

  @POST(registerEndpoint)
  Future<RegisterVo> registerUser(
    @Field("name") String name,
    @Field("phone_no") String phoneNumber,
    @Field("password") String password,
    @Field("address") String address,
    @Field("buyer_category") int buyerCategory,
    @Field("shop_name") String shopName,
    @Field("shop_address") String shopAddress,
  );

  ///Login

  @POST(loginEndpoint)
  Future<LoginResponseVo> login(
    @Field("phone_no") String phoneNumber,
    @Field("password") String password,
  );

  ///get Product

  @POST(getProductEndpoint)
  Future<GetProductResponseVo> getProduct(
    @Field("buyer_id") int buyerID,
  );

  /// Product order

  @POST(orderEndpoint)
  Future<ProductOrderResponseVo> productOrder(
    @Field("orders") Orders orders,
    @Field("products") List<Product> products,
  );

  ///get Product order List

  @POST(getOrderHistoryEndpoint)
  Future<OrderListResponseVo> getProductOrderList(
    @Field("buyer_id") int buyerID,
  );
}
