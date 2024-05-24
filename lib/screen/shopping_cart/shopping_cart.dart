import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:bmi_buyer/screen/buying_process/buyer_confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/color.dart';
import '../../data/response_vo/get_product_response_vo.dart';
import '../../reusable_button.dart';
import '../../reusable_text.dart';
import '../../reusable_textField.dart';
import '../buying_process/buyer_goods_type.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key,  this.phone,  this.deliveryAddress,   this.measurement,  this.buyerID, this.hasDelivery});
final String? phone,deliveryAddress;
  //final ProductElement? productsDetails;
  final Measurement? measurement;
  final int? buyerID,hasDelivery;

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int? currentIndex;
  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<GetProductProvider>(
          builder: (context, value, child) => LayoutBuilder(

            builder: (context,constraints)
            {
              final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
              value.quantityController.text=value.orderList[index].quantity.toString();
             return Container(
                height: 100+keyboardHeight,
                padding:  EdgeInsets.only(left: 26.0,right: 26,bottom: keyboardHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (widget.buyerID==1)? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        GestureDetector(
                          child: const Icon(Icons.remove),
                          onTap: () {
                            if (value.orderList[index].quantity == 1) {
                              value.removeOrder(index);
                              Navigator.pop(context);
                              if (value.orderList.isEmpty) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const BuyerGoodsType()),
                                        (Route<dynamic> route) => false);
                              }
                            } else {
                              value.removeFromCartWithIndex(index,value.orderList[index].quantity,context);
                              if (value.orderList[index].quantity == 0) {
                                Navigator.pop(context);
                              }
                            }

                            // Add your functionality here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ReusableText(
                            reuseText:
                            value.orderList[index].quantity.toString()),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: const Icon(Icons.add),
                          onTap: () {
                            value.addToCartWithIndex(index,value.orderList[index].quantity);
                            // Add your functionality here
                          },
                        ),
                      ],
                    ):
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: ReusableTextField(
                        //autoFocus: true,
                        keyboardType: TextInputType.number,
                        //hintText: "50",
                        textEditingController: value.quantityController,

                        onChanged: (textValue) {
                          //value.quantityController.text = textValue;
                          value.editQuantityWholeSale(index, int.parse(textValue));
                        },
                        onSubmitted: (string) {
                          if (int.parse(string) < 50) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'သတိပြုရန်',
                              desc: 'အနည်းဆုံးမှာယူရမည့် ပမာဏမှာ ၅၀ ဖြစ်ပါသည်',
                              // btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                           // value.quantityController.text = string;
                            value.editQuantityWholeSale(index, int.parse(string));
                          }
                        },
                      ),
                    ),

                    ReusableText(
                        reuseText: "${value.orderList[index].totalAmount.toString()} ကျပ်"),
                    IconButton(onPressed: (){
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'သတိပြုရန်',
                        desc: 'ပယ်ဖျက်ရန် သေချာပါသလား',
                        btnOkText: "သေချာပါသည်",
                       btnCancelText:  "မလုပ်ပါ",
                         btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          value.removeOrder(index);
                          Navigator.pop(context);
                          if (value.orderList.isEmpty) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const BuyerGoodsType()),
                                    (Route<dynamic> route) => false);
                          }
                        },
                      ).show();


                    }, icon: Icon(Icons.delete_forever,color: Colors.redAccent,size: 30,))
                  ],
                ),
              );}

          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetProductProvider>(
        builder: (context, value, child) => Scaffold(
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
                  reuseText: "စျေးဝယ်ခြင်း",
                  fSize: 16,
                  fWeight: FontWeight.bold,
                  fColor: white,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.orderList.length,
                      itemBuilder: (context, index) {

                        currentIndex=index;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showBottomSheet(context, index);
                                      },
                                      child: Container(
                                          width: 35,
                                          height: 35,
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: yellow),
                                          child: Center(
                                              child: ReusableText(
                                                  reuseText:
                                                      "${value.orderList[index].quantity} "))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ReusableText(
                                        reuseText:
                                            "${value.orderList[index].name}  ${value.orderList[index].measurement} "),
                                  ],
                                ),
                                ReusableText(
                                    reuseText:
                                        "${value.orderList[index].totalAmount} ကျပ်"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   IgnorePointer(
                     ignoring: (value.orderList.isEmpty) ,
                     child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: ReusableButton(
                        onTap: () {
                          if(value.buyerType==1){
                            value.orderCount=1;
                          }else{
                            value.orderCount=50;
                          }

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const BuyerGoodsType()),
                              (Route<dynamic> route) => true);
                        },
                        // width: MediaQuery.of(context).size.width,
                        text: "ပစ္စည်း ထပ်ထည့်ရန်",
                        color:(value.orderList.isEmpty) ?yellow.withOpacity(0.2): yellow,
                        textColor:(value.orderList.isEmpty) ?black.withOpacity(0.5): black,
                      ),
                                       ),
                   ),

                  IgnorePointer(
                    ignoring: (value.orderList.isEmpty) ,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: ReusableButton(
                          onTap: () {

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => BuyerConfirmScreen(
                                      hasDeli:widget.hasDelivery,
                                        measurement: widget.measurement,
                                        riceType: value.orderList[currentIndex??0].name,
                                        quantity: value.orderList[currentIndex??0].quantity.toString(),
                                        totalAmount: "",
                                        phone: value.orderList[currentIndex??0].phone??"",
                                        address: widget.deliveryAddress??"",
                                        deliveryAddress: value.orderList[currentIndex??0].deliverLocation, orderList: value.orderList,)),
                                (Route<dynamic> route) => true);
                          },
                          //width: MediaQuery.of(context).size.width,
                          text: "အော်ဒါတင််ပါ",
                          color:(value.orderList.isEmpty) ?green.withOpacity(0.2): green,
                          textColor: white,
                        ),

                    ),
                  ),
                ],
              ),
            ));
  }
}
