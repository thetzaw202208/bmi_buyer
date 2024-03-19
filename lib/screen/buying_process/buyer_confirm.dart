import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/color.dart';
import '../../data/request_vo/product_order_request_vo.dart';
import '../../data/response_vo/get_product_response_vo.dart';
import '../../data/static_data/cart_model.dart';
import '../../reusable_button.dart';
import '../../reusable_text.dart';

class BuyerConfirmScreen extends StatelessWidget {
  const BuyerConfirmScreen(
      {super.key,
      required this.riceType,
      required this.quantity,
      required this.totalAmount,
      required this.phone,
      required this.address,
      required this.deliveryAddress,
      required this.orderList,
      this.productsDetails,
      this.measurement});
  final String riceType, quantity, totalAmount, phone, address, deliveryAddress;
  final List<CartModel> orderList;
  final ProductElement? productsDetails;
  final Measurement? measurement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: green,
        title: const ReusableText(
          reuseText: "အတည်ပြုရန်",
          fWeight: FontWeight.bold,
          fSize: 18,
          fColor: white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Material(
            elevation: 10,
            borderOnForeground: true,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [


                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   height: 50,
                   decoration: BoxDecoration(
                     color: green.withOpacity(0.4),
                     // borderRadius: BorderRadius.circular(10)
                   ),
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ReusableText(
                           reuseText: "အရေအတွက်", fWeight: FontWeight.bold),
                       ReusableText(
                           reuseText: "အမျိုးအစား", fWeight: FontWeight.bold),
                       ReusableText(
                           reuseText: "စျေးနှုန်း", fWeight: FontWeight.bold),
                     ],
                   ),
                 ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      // const ReusableText(
                      //   reuseText: "အရေအတွက်",
                      //   fWeight: FontWeight.bold,
                      // ),

                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width*.2,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: orderList.length,
                          itemBuilder: (context, index) => ReusableText(
                            align: TextAlign.start,
                            fSize: 12,
                            reuseText: "${orderList[index].quantity}အိတ်  ",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                         width: MediaQuery.of(context).size.width*.3,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: orderList.length,
                          itemBuilder: (context, index) => ReusableText(
                            align: TextAlign.start,
                            fSize: 12,
                            reuseText:
                            "${orderList[index].name} ${orderList[index].measurement}",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width*.3,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: orderList.length,
                          itemBuilder: (context, index) => ReusableText(
                            fSize: 12,
                            reuseText: "${orderList[index].totalAmount} ကျပ်",
                            align: TextAlign.end,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const DottedLine(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableText(
                          reuseText: "ဖုန်းနံပါတ်", fWeight: FontWeight.bold),
                      ReusableText(reuseText: phone),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableText(
                        reuseText: "ပို့ရမည့် လိပ်စာ",
                        fWeight: FontWeight.bold,
                      ),
                      ReusableText(reuseText: deliveryAddress),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<GetProductProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ReusableButton(
            onTap: () {
              value.addOrder(
                  Orders(
                      buyerId: value.id,
                      orderDate: DateTime.now(),
                      deliveryAddress: deliveryAddress,
                      phoneNo: phone),
                  value.productsRequest,
                  context);

              // value.addOrder(riceType, quantity, value.totalAmount, value.orderCount, value.deliveryLocation.text);
            },
            width: MediaQuery.of(context).size.width,
            text: "မှာယူရန် သေချာပါသည်",
            color: green,
            textColor: white,
          ),
        ),
      ),
    );
  }
}
