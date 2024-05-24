import 'package:bmi_buyer/provider/get_order_list_provider.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/screen/buying_process/buyer_goods_type.dart';
import 'package:bmi_buyer/screen/history/history_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import '../../const/color.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetOrderListProvider>(
      create: (context) => GetOrderListProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const BuyerGoodsType()),
                  (Route<dynamic> route) => false);
            },
          ),
          backgroundColor: green,
          iconTheme: const IconThemeData(color: white),
          centerTitle: true,
          title: const ReusableText(
            reuseText: "ဝယ်ယူမှု မှတ်တမ်း",
            fSize: 16,
            fWeight: FontWeight.bold,
            fColor: white,
          ),
        ),
        body: Consumer<GetOrderListProvider>(
          builder: (context, value, child) => value.orderList != []
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: value.orderList?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          foregroundDecoration:
                              RotatedCornerDecoration.withColor(
                            color: value.orderList?[index].statusId == 1
                                ? yellow
                                : value.orderList?[index].statusId == 2
                                    ? green
                                    : value.orderList?[index].statusId == 3
                                        ? Colors.blue
                                        : Colors.red,
                            badgeSize: const Size(100, 60),
                            spanBaselineShift: 5,
                            spanHorizontalOffset: 5,
                            badgeCornerRadius: const Radius.circular(10),
                            textSpan: TextSpan(
                              text: "${value.orderList?[index].status}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Expanded(
                              //   child: ListView.builder(
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: value.orderList?[index]
                              //           .productOrderDetails?.length,
                              //       itemBuilder: (context, orderIndex) {
                              //         return ReusableText(
                              //           reuseText:
                              //               "${value.orderList?[index].productOrderDetails?[orderIndex].productName},",
                              //           fWeight: FontWeight.bold,
                              //           overflow: TextOverflow.ellipsis,
                              //         );
                              //       }),
                              // ),
                              // Expanded(
                              //   child: ListView.builder(
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: value.orderList?[index]
                              //           .productOrderDetails?.length,
                              //       itemBuilder: (context, orderIndex) {
                              //         return Row(
                              //           children: [
                              //             Text(""),
                              //             const SizedBox(
                              //               width: 10,
                              //             ),
                              //             Text(
                              //                 "${value.orderList![index].productOrderDetails?[orderIndex].qty} အိတ်"),
                              //           ],
                              //         );
                              //       }),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // ReusableText(
                                  //     reuseText: value
                                  //         .orderList?[index].deliveryAddress),
                                  const ReusableText(
                                    reuseText: "ရက်စွဲ",
                                    fWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  ReusableText(
                                      reuseText: value
                                          .orderList?[index].orderDate
                                          .toString()
                                          .split(".")[0]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const ReusableText(
                                      reuseText: "လိပ်စာ",
                                      fWeight: FontWeight.bold),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: ReusableText(
                                        align: TextAlign.start,
                                        reuseText: value
                                            .orderList?[index].deliveryAddress),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => HistoryDetails(
                                                orderList: value
                                                    .orderList![index]
                                                    .productOrderDetails!,
                                                address: value.orderList![index]
                                                        .deliveryAddress ??
                                                    "",
                                                deliveryType:value.orderList![index].deliveryType,
                                                phone: value.orderList![index]
                                                        .phoneNo ??
                                                    "",
                                                status: value.orderList![index]
                                                        .status ??
                                                    "",
                                            statusID: value.orderList![index].statusId??1,
                                              )),
                                      (Route<dynamic> route) => true);
                                },
                                child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: ReusableText(
                                      reuseText: "အသေးစိတ်ကြည့်ရန်",
                                      fSize: 11,
                                      align: TextAlign.end,
                                      fColor: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Material(
                    //     elevation: 5,
                    //     borderRadius: BorderRadius.circular(10),
                    //     child: ListTile(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       leading: Material(
                    //         elevation: 5,
                    //         borderRadius: BorderRadius.circular(100),
                    //         child: Container(
                    //           width: 40,
                    //           height: 40,
                    //           decoration: BoxDecoration(
                    //               shape: BoxShape.circle, color: Colors.red),
                    //           child: IconButton(
                    //               onPressed: () {
                    //                 _showBottomSheet(context,index);
                    //               },
                    //               icon: ReusableText(
                    //                   reuseText:
                    //                       value.orderList[index].orderCount.toString(),fColor: white,)),
                    //         ),
                    //       ),
                    //       title: ReusableText(
                    //           reuseText: value.orderList[index].riceType),
                    //       subtitle: ReusableText(
                    //           reuseText: value.orderList[index].quantity),
                    //       trailing: ReusableText(
                    //           reuseText:
                    //               "${value.orderList[index].totalAmount} ကျပ်"),
                    //     ),
                    //   ),
                    // )
                  ),
                )
              : const Center(
                  child: ReusableText(
                    reuseText: "No data",
                  ),
                ),
        ),
      ),
    );
  }
}
