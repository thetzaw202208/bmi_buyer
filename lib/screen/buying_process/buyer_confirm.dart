import 'package:bmi_buyer/font_size_ext.dart';
import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/color.dart';
import '../../const/dimen.dart';
import '../../data/request_vo/product_order_request_vo.dart';
import '../../data/response_vo/get_product_response_vo.dart';
import '../../data/static_data/cart_model.dart';
import '../../reusable_button.dart';
import '../../reusable_text.dart';

class BuyerConfirmScreen extends StatefulWidget {
  const BuyerConfirmScreen(
      {super.key,
      required this.riceType,
      required this.quantity,
      required this.totalAmount,
      required this.phone,
      required this.address,
      required this.deliveryAddress,
      required this.orderList,

      this.measurement, this.hasDeli});
  final String riceType, quantity, totalAmount, phone, address, deliveryAddress;
  final List<CartModel> orderList;
  final int? hasDeli;

  final Measurement? measurement;

  @override
  State<BuyerConfirmScreen> createState() => _BuyerConfirmScreenState();
}

class _BuyerConfirmScreenState extends State<BuyerConfirmScreen> {
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
      body: Consumer<GetProductProvider>(
        builder: (context,data,_)=> SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Column(
              children: [
                Material(
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
                                itemCount: widget.orderList.length,
                                itemBuilder: (context, index) => ReusableText(
                                  align: TextAlign.start,
                                  fSize: context.calculateFontSize(),
                                  reuseText: "${widget.orderList[index].quantity}အိတ်  ",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                               width: MediaQuery.of(context).size.width*.3,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.orderList.length,
                                itemBuilder: (context, index) => SizedBox(
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    style: TextStyle(

                                      fontSize: context.calculateFontSize(),
                                    ),


                                    "${widget.orderList[index].name} ${widget.orderList[index].measurement}",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width*.3,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.orderList.length,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 150,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: context.calculateFontSize(),),

                                    "${widget.orderList[index].totalAmount} ကျပ်",

                                  ),
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
                                reuseText: "ဖုန်းနံပါတ်", fWeight: FontWeight.bold),
                            ReusableText(reuseText: widget.phone),
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
                                child: Text( widget.deliveryAddress,textAlign: TextAlign.right,)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                ///Pick Up or Deli
                if(data.buyerType==1)
                  const Text("* ပို့ဆောင်ခကို ဝယ်ယူသူဖက်မှ ပေးချေရမည် ဖြစ်ပါသည်။ မြို့နယ်အလိုက် ပို့ဆောင်ခများ သတ်မှတ်ထားပါသည်။",style: TextStyle(color: Colors.red),),
              if(widget.hasDeli==1)  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      child: GridView.builder(
                          itemCount: data.pickDeliList.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 10,
                              childAspectRatio: 5,
                              crossAxisCount: 2),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              data.selectPickOrDeli(index);
                              // value.selectExportTypeFun(
                              //     index, value.exportList[index].id);
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                // padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: data.selectedPickDeli ==
                                          index
                                          ? green.withOpacity(0.5)
                                          : white,
                                      borderRadius:
                                      BorderRadius.circular(50)),
                                  child: Center(
                                    child: ReusableText(
                                      reuseText:
                                      data.pickDeliList[index].name,
                                      fSize: 13,
                                      fColor: data.selectedPickDeli ==
                                          index
                                          ? white
                                          : black,
                                      fWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible,
                                    ),
                                  )),
                            ),
                          )),



              ),
                SizedBox(height: 10,),
                if(data.selectedPickDeli==1)
                  const Text("* ပို့ဆောင်ခကို ဝယ်ယူသူဖက်မှ ပေးချေရမည် ဖြစ်ပါသည်။ မြို့နယ်အလိုက် ပို့ဆောင်ခများ သတ်မှတ်ထားပါသည်။",style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<GetProductProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: IgnorePointer(
            ignoring:value.loading,
            child: ReusableButton(

              onTap: () {
                value.enableLoading();
                Future.delayed(const Duration(seconds: 2),(){
                  value.addOrder(
                      Orders(
                          buyerId: value.id,
                          orderDate: DateTime.now(),
                          deliveryAddress: widget.deliveryAddress,
                          phoneNo: widget.phone,
                      deliveryType: value.pickDeliList[value.selectedPickDeli].id),
                      value.productsRequest,
                      context);
                });


                // value.addOrder(riceType, quantity, value.totalAmount, value.orderCount, value.deliveryLocation.text);
              },
              widget: value.loading?const Center(child: CircularProgressIndicator(color: white,),):ReusableText(reuseText: "မှာယူရန် သေချာပါသည်",fColor: white,),
              width: MediaQuery.of(context).size.width,
              text: "",
              color:value.loading?green.withOpacity(0.5): green,
              textColor: white,
            ),
          ),
        ),
      ),
    );
  }
}
