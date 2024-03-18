// import 'package:flutter/material.dart';
//
// import '../data/static_data/cart_model.dart';
//
// class AddToCartProvider extends ChangeNotifier {
//   List<CartModel> orderList = [];
//
//   int orderCount = 1;
//   int totalAmount=188000;
//   int showTotal=0;
//   void addToCart() {
//     orderCount++;
//     totalAmount+=188000;
//    notifyListeners();
//   }
//
//   void removeFromCart() {
//     orderCount--;
//     totalAmount-=188000;
//     notifyListeners();
//   }



//
//
//   showTotalAmount(){
//     showTotal=0;
//     for(var i=0;i<orderList.length;i++){
//       showTotal+=orderList[i].totalAmount;
//     }
//     notifyListeners();
//   }
//   remove(){
//     orderCount=1;
//     totalAmount=188000;
//     notifyListeners();
//   }
// }
