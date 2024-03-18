import 'package:bmi_buyer/data/network/data_agents/get_product/get_product_data_agent.dart';
import 'package:bmi_buyer/data/network/data_agents/get_product/get_product_data_agent_impl.dart';
import 'package:bmi_buyer/data/network/data_agents/product_order/product_order_data_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/data_agents/product_order/product_order_data_agent_impl.dart';
import '../data/request_vo/product_order_request_vo.dart';
import '../data/response_vo/get_product_response_vo.dart';
import '../data/static_data/cart_model.dart';
import '../screen/buying_process/buyer_process_success.dart';

class GetProductProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController deliveryLocation = TextEditingController();

  GetProductDataAgent getProductDataAgent = GetProductDataAgentImpl();
  ProductOrderDataAgent productOrderDataAgent = ProductOrderDataAgentImpl();
  bool loading = false;
  int? id;
  String phone = "", address = "";
  int orderCount = 1;
  List<ProductElement>? products = [];
  List<Measurement>? measurements = [];
  List<CartModel> orderList = [];
  List<Product> productsRequest = [];
  Orders? orders;
  List<Product>? orderProducts;
  enableLoading() {
    loading = true;
    notifyListeners();
  }

  disableLoading() {
    loading = false;
    notifyListeners();
  }

  GetProductProvider() {
    getProduct();
    notifyListeners();
  }
  addOrder(Orders orders, List<Product> products, BuildContext context) {
    // orderList.clear();
    productOrderDataAgent.productOrder(orders, products).then((value) {
      for (var i = 0; i < products.length; i++) {
        print(
            "product order request length ${products.length} productID=  ${products[i].productId}, qty= ${products[i].qty}, toAmt=${products[i].totalAmount}, mID = ${products[i].measurementId}. ${orders.buyerId} buyer id");
      }

      if (value.code == 200) {
        productsRequest.clear();
        orderList.clear();
orderCount=1;
        print("product order success ${value.data?[0].productId}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BuyProcessSuccess()),
            (Route<dynamic> route) => false);
      }
    });
    notifyListeners();
  }

  void addToCart() {
    orderCount++;

    notifyListeners();
  }

  addOrderList(
      int buyerID, DateTime orderDate, String deliveryAddress, String phone) {
    orders = Orders(
        buyerId: buyerID,
        orderDate: orderDate,
        deliveryAddress: deliveryAddress,
        phoneNo: phone);
  }

  ///Add to cart
  addToCartOrder(String name, String measurement, int totalAmount, int orgPrice,
      int orderCounts, String deliverLocation, String phoneNo) {
    orderList.add(CartModel(name, measurement, totalAmount, orgPrice,
        orderCounts, deliverLocation, phoneNo));
    //orderCount = 1;
    notifyListeners();
  }

  void addToCartWithIndex(int index, int quantities) {
    orderList[index].quantity++;
    orderList[index].totalAmount =
        orderList[index].originalPrice * orderList[index].quantity;

    notifyListeners();
  }

  ///remove order form cart
  void removeOrder(int index) {
    orderList.removeAt(index);

    notifyListeners();
  }

  ///remove from cart with index
  void removeFromCartWithIndex(int index, int quantities) {
    orderList[index].quantity--;
    orderList[index].totalAmount =
        orderList[index].originalPrice * orderList[index].quantity;

    notifyListeners();
  }

  void removeFromCart() {
    orderCount--;

    notifyListeners();
  }

  getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt("buyer_id") ?? 1;
    phone = sharedPreferences.getString("phone") ?? "";
    deliveryLocation.text = sharedPreferences.getString("address") ?? "";
    getProductList(id ?? 1);
  }

  getProductList(int buyerID) async {
    print("calling product list $id");
    getProductDataAgent.getProduct(buyerID).then((value) {
      if (value.code == 200) {
        products = value.data?.products;
        measurements = value.data?.measurements;

        disableLoading();
      } else {
        disableLoading();
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
