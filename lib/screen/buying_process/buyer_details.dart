import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/const/dimen.dart';
import 'package:bmi_buyer/data/response_vo/get_product_response_vo.dart';
import 'package:bmi_buyer/provider/cart_provider.dart';
import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:bmi_buyer/reusable_button.dart';
import 'package:bmi_buyer/reusable_text.dart';
import 'package:bmi_buyer/reusable_textField.dart';
import 'package:bmi_buyer/screen/buying_process/buyer_confirm.dart';
import 'package:bmi_buyer/screen/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../const/color.dart';
import '../../data/request_vo/product_order_request_vo.dart';
import 'buyer_goods_type.dart';

class BuyerDetails extends StatefulWidget {
  const BuyerDetails({
    super.key,
    required this.productsDetails,
    required this.measurement,
    required this.phone,
    required this.address,
  });
  final ProductElement productsDetails;
  final Measurement measurement;
  final String phone, address;

  @override
  State<BuyerDetails> createState() => _BuyerDetailsState();
}

class _BuyerDetailsState extends State<BuyerDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetProductProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: green,
          title: const ReusableText(
            reuseText: "အချက်အလက် အသေးစိတ်",
            fWeight: FontWeight.bold,
            fSize: 18,
            fColor: white,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 10,
                child: Image.network(
                  width: MediaQuery.of(context).size.width*.9,

                    widget.productsDetails.photo?.originalUrl??"https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg"),
              ),
            ),
            // Image.asset(
            //   "assets/images/12/1.jpg",
            //   width: 180,
            //   height: 160,
            // ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    reuseText: "အမျိုးအစား",
                    fWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    reuseText: widget.productsDetails.product?.name,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    reuseText: "အလေးချိန်",
                    fWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    reuseText: widget.measurement.name,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      reuseText: "စျေးနှုန်း", fWeight: FontWeight.bold),
                  ReusableText(
                      reuseText: "${widget.productsDetails.price} ကျပ်"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    reuseText: "ပို့ရမည့် လိပ်စာ",
                    fWeight: FontWeight.bold,
                  ),
                  ReusableTextField(
                    textEditingController: value.deliveryLocation,
                    //hintText: widget.address,
                    borderColor: kLoginBorderColor,
                    borderRadius: kLargeBorderRadius,
                    prefixIcon: const Opacity(
                        opacity: 0.5, child: Icon(Icons.location_on_rounded)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          decoration: const BoxDecoration(color: green),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  ReusableText(
              //   reuseText: "စုစုပေါင်း : ${value.totalAmount} ကျပ်",
              //   fColor: white,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      ignoring: value.orderCount == 1,
                      child: GestureDetector(
                        onTap: () {
                          if (value.orderCount == 1) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'သတိပြုရန်',
                              desc: 'အနည်းဆုံးမှာယူရမည့် ပမာဏရောက်နေပါသည်',
                              // btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            value.removeFromCart();
                          }
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: value.orderCount == 1
                              ? black.withOpacity(0.4)
                              : white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ReusableText(
                      reuseText: value.orderCount.toString(),
                      fWeight: FontWeight.bold,
                      fSize: kFontSize20,
                      fColor: white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        value.addToCart();
                      },
                      child: const Icon(
                        Icons.add_circle_outline,
                        color: white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
             ReusableButton(
                  width: MediaQuery.of(context).size.width * .5,
                  onTap: () async {
                    value.addOrderList(widget.productsDetails.product?.id??1, DateTime.now(), value.deliveryLocation.text, value.phone);
                    value.addToCartOrder(
                        widget.productsDetails.product?.name ?? "",
                        widget.measurement.name ?? "",
                        int.parse(widget.productsDetails.price ?? "0")*value.orderCount,
                        int.parse(widget.productsDetails.price ?? "0"),
                        value.orderCount,
                        value.deliveryLocation.text,value.phone);
                    value.productsRequest.add(Product(
                      productId: widget.productsDetails.product?.id ?? 1,
                      measurementId: widget.measurement.id ?? 1,
                      totalAmount:
                      int.parse(widget.productsDetails.price ?? "0") * value.orderCount,
                      qty: value.orderCount,
                    ));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => ShoppingCart(

                                  phone: value.phone,
                                  deliveryAddress: value.deliveryLocation.text,
                                  productsDetails: widget.productsDetails,
                                  measurement: widget.measurement,
                                )),
                        (Route<dynamic> route) => false);
                  },
                  text: "စျေးဝယ်ခြင်းသို့ ထည့်ရန်",
                  color: yellow,
                  height: 40,
                ),

            ],
          ),
        ),
      ),
    );
  }
}
