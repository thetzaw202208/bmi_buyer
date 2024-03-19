import 'package:bmi_buyer/const/img.dart';
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../reusable_text.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails(
      {super.key, required this.orderList, required this.address, required this.phone, required this.status, required this.statusID,});
  final List<ProductOrderDetail> orderList;
  final String address,phone,status;
  final int statusID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ဝယ်ယူမှု မှတ်တမ်း အသေးစိတ်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(width: 150,height: 150,child: Image.asset(statusID==1?pendingImg:statusID==2?orderDeliverImg:statusID==3?successImg:cancelImg),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                          SizedBox(width: 20,),
                          ReusableText(
                              reuseText: "စျေးနှုန်း", fWeight: FontWeight.bold),
                          // SizedBox(width: 10,),
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
                            height: orderList.length>8? MediaQuery.of(context).size.height*.3: MediaQuery.of(context).size.height*.2,
                            width: MediaQuery.of(context).size.width*.2,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: orderList.length,
                              itemBuilder: (context, index) => ReusableText(
                                align: TextAlign.start,
                                fSize: 12,
                                reuseText: "${orderList[index].qty}အိတ်  ",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orderList.length>8? MediaQuery.of(context).size.height*.3: MediaQuery.of(context).size.height*.2,
                            width: MediaQuery.of(context).size.width*.3,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: orderList.length,
                              itemBuilder: (context, index) => ReusableText(
                                align: TextAlign.start,
                                fSize: 12,
                                reuseText:
                                "${orderList[index].productName} ${orderList[index].measurement}",
                              ),
                            ),
                          ),
                          SizedBox(
                            height:orderList.length>8? MediaQuery.of(context).size.height*.3: MediaQuery.of(context).size.height*.2,
                            width: MediaQuery.of(context).size.width*.3,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
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
                          ReusableText(reuseText: address),
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
                            reuseText: "အော်ဒါ အခြေအနေ",
                            fWeight: FontWeight.bold,
                          ),
                          ReusableText(reuseText: status),
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
          ],
        ),
      ),
    );
  }
}
