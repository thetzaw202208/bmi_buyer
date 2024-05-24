import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/data/network/data_agents/get_product/get_product_data_agent.dart';
import 'package:bmi_buyer/data/network/data_agents/get_product/get_product_data_agent_impl.dart';
import 'package:bmi_buyer/data/network/data_agents/product_order/product_order_data_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/data_agents/product_order/product_order_data_agent_impl.dart';
import '../data/request_vo/product_order_request_vo.dart';
import '../data/response_vo/get_product_response_vo.dart';
import '../data/static_data/cart_model.dart';
import '../screen/buying_process/buyer_process_success.dart';
class PickOrDeli{
  int id;
  String name;

  PickOrDeli(this.id, this.name);
}
class GetProductProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController deliveryLocation = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  GetProductDataAgent getProductDataAgent = GetProductDataAgentImpl();
  ProductOrderDataAgent productOrderDataAgent = ProductOrderDataAgentImpl();
  bool loading = false;
  int? id;
  int? buyerType;
  int selectedPickDeli=0;
  String phone = "", address = "";
  int orderCount = 1;
List<ProductDetailsData>? productList=[];
  List<CartModel> orderList = [];
  List<Product> productsRequest = [];
  List<PickOrDeli> pickDeliList=[
    PickOrDeli(1, "PickUp"),
    PickOrDeli(2, "Delivery"),
  ];
  Orders? orders;
  List<Product>? orderProducts;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  onLoading() {
    enableLoading();
    print("Refresh work");

    Future.delayed(const Duration(seconds: 2), () {
      getProduct();
      disableLoading();
    });
  }

  enableLoading() {
    loading = true;
    notifyListeners();
  }
selectPickOrDeli(index){
    selectedPickDeli=index;
    notifyListeners();
}
  disableLoading() {
    loading = false;
    notifyListeners();
  }
resetProvider(){
  productsRequest.clear();
  quantityController.text="";
  selectedPickDeli=0;
  orderList.clear();
  if (buyerType == 1) {
    orderCount = 1;
  } else {
    orderCount = 50;
  }
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
            "delitype is ${orders.deliveryType} product order request length ${products.length} productID=  ${products[i].productId}, qty= ${products[i].qty}, toAmt=${products[i].totalAmount}, mID = ${products[i].measurementId}. ${orders.buyerId} buyer id");
      }

      if (value.code == 200) {
        disableLoading();
        productsRequest.clear();
        quantityController.text="";
        orderList.clear();
        if (buyerType == 1) {
          orderCount = 1;
        } else {
          orderCount = 50;
        }
        notifyListeners();
        print("product order success ${value.data?[0].productId}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BuyProcessSuccess()),
            (Route<dynamic> route) => false);
      } else {
        disableLoading();

        notifyListeners();
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

    notifyListeners();
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
    productsRequest.removeAt(index);
    quantityController.text='';
    notifyListeners();
  }

  void editQuantityWholeSale(int index,int editQuantity){
    orderList[index].totalAmount=orderList[index].originalPrice * editQuantity;
    orderList[index].quantity=editQuantity;

    notifyListeners();
  }
  ///remove from cart with index
  void removeFromCartWithIndex(
      int index, int quantities, BuildContext context) {
    if (buyerType == 1) {
      orderList[index].quantity--;
      orderList[index].totalAmount =
          orderList[index].originalPrice * orderList[index].quantity;
    } else {
      if (orderList[index].quantity <= 50) {
        AwesomeDialog(
          dialogType: DialogType.error,
          context: context,
          desc: "အနည်းဆုံးမှာယူရမည့် ပမာဏသို့ ရောက်ရှိနေပါသည်",
          btnOkOnPress: () {},
        ).show();
      } else {
        orderList[index].quantity--;
        orderList[index].totalAmount =
            orderList[index].originalPrice * orderList[index].quantity;
      }
    }

    notifyListeners();
  }

  void removeFromCart() {
    orderCount--;

    notifyListeners();
  }

  getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt("buyer_id") ?? 1;
    buyerType = sharedPreferences.getInt("buyer_type");
    phone = sharedPreferences.getString("phone") ?? "";
    deliveryLocation.text = sharedPreferences.getString("address") ?? "";
    if (buyerType == 1) {
      orderCount = 1;
    } else {
      orderCount = 50;
    }
    getProductList(id ?? 1);
  }

  getProductList(int buyerID) async {
    print("calling product list $id");
    getProductDataAgent.getProduct(buyerID).then((value) {
      if (value.code == 200) {
        productList=value.data?.products;
        notifyListeners();
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
