import 'package:bmi_buyer/const/dimen.dart';
import 'package:bmi_buyer/const/img.dart';
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../reusable_text.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({
    super.key,
    required this.orderList,
    required this.address,
    required this.phone,
    required this.status,
    required this.statusID, required this.deliveryType,
  });
  final List<ProductOrderDetail> orderList;
  final String address, phone, status;
  final String? deliveryType;
  final int statusID;

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  int totalAmount = 0;
  calculateTotal(){
    for(var i=0;i<widget.orderList.length;i++){
      setState(() {
        totalAmount += int.parse(
            "${widget.orderList[i].totalAmount}");
      });
    }

  }
  @override
  void initState() {

    calculateTotal();
    super.initState();
  }
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
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(widget.statusID == 1
                  ? pendingImg
                  : widget.statusID == 2
                      ? orderDeliverImg
                      : widget.statusID == 3
                          ? successImg
                          : cancelImg),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                              reuseText: "အမျိုးအစား",
                              fWeight: FontWeight.bold),
                          SizedBox(
                            width: 20,
                          ),
                          ReusableText(
                              reuseText: "စျေးနှုန်း",
                              fWeight: FontWeight.bold),
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
                            height: widget.orderList.length > 8
                                ? MediaQuery.of(context).size.height * .3
                                : MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .2,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.orderList.length,
                              itemBuilder: (context, index) => ReusableText(
                                align: TextAlign.start,
                                fSize: 12,
                                reuseText:
                                    "${widget.orderList[index].qty}အိတ်  ",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: widget.orderList.length > 8
                                ? MediaQuery.of(context).size.height * .3
                                : MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .3,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.orderList.length,
                              itemBuilder: (context, index) => ReusableText(
                                align: TextAlign.start,
                                fSize: 12,
                                reuseText:
                                    "${widget.orderList[index].productName} ${widget.orderList[index].measurement}",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: widget.orderList.length > 8
                                ? MediaQuery.of(context).size.height * .3
                                : MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .3,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.orderList.length,
                              itemBuilder: (context, index) {


                                return ReusableText(
                                  fSize: 12,
                                  reuseText:
                                      "${widget.orderList[index].totalAmount} ကျပ်",
                                  align: TextAlign.end,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const DottedLine(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const ReusableText(
                              reuseText: "စုစုပေါင်း ငွေပမာဏ",
                              fWeight: FontWeight.bold),
                          ReusableText(reuseText: "$totalAmount ကျပ်",fWeight: FontWeight.bold,fSize: kFontSize16,),
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
                              reuseText: "ဖုန်းနံပါတ်",
                              fWeight: FontWeight.bold),
                          ReusableText(reuseText: "${widget.phone}"),
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
                          SizedBox(
                              width: 200,
                              child: Text(widget.address,
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   if(widget.deliveryType!="") Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReusableText(
                              reuseText: "Delivery Type",
                              fWeight: FontWeight.bold),
                          ReusableText(reuseText: "${widget.deliveryType}"),
                        ],
                      ),
                    ),
                    if(widget.deliveryType!="")const SizedBox(
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
                          ReusableText(reuseText: widget.status),
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
