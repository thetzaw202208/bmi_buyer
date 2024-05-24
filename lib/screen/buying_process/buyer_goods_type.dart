import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_buyer/custom_drawer.dart';
import 'package:bmi_buyer/provider/get_product_provider.dart';
import 'package:bmi_buyer/screen/buying_process/buyer_details.dart';
import 'package:bmi_buyer/screen/shopping_cart/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../const/color.dart';
import '../../reusable_button.dart';
import '../../reusable_text.dart';
import '../history/history.dart';

class BuyerGoodsType extends StatefulWidget {
  const BuyerGoodsType({super.key});

  @override
  State<BuyerGoodsType> createState() => _BuyerGoodsTypeState();
}

class _BuyerGoodsTypeState extends State<BuyerGoodsType> {
  int? selectedType;
  int? selectQty;
  void _handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      scaffoldChild: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: _handleMenuButtonPressed,
            child: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<GetProductProvider>(
                builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShoppingCart()));
                    },
                    child: Badge(
                      isLabelVisible: value.orderList.isEmpty ? false : true,
                      label: Text(value.orderList.length.toString()),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // ReusableText(reuseText: "ဝယ်ယူမှု မှတ်တမ်း",fWeight: FontWeight.bold,),
                          Icon(
                            Icons.add_shopping_cart,
                            size: 30,
                          ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryScreen()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // ReusableText(reuseText: "ဝယ်ယူမှု မှတ်တမ်း",fWeight: FontWeight.bold,),
                      Icon(
                        Icons.history,
                        size: 30,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        body: Consumer<GetProductProvider>(
          builder: (context, data, _) => data.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: data.onLoading,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                              reuseText: "အချက်အလက် အသစ်ရယူနိုင်ရန်် နှိပ်ပါ  ",
                              fSize: 14,
                              fColor: Colors.blue,
                              fWeight: FontWeight.bold,
                              overflow: TextOverflow.visible,
                            ),
                            Icon(
                              Icons.refresh,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const ReusableText(
                        reuseText: "ကုန်ပစ္စည်းအမျိုးအစား ရွေးချယ်ရန်",
                        fSize: 16,
                        fWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      (data.productList != [])
                          ? Expanded(
                              child: GridView.builder(
                                  itemCount: data.productList?.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 4,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedType = index;
                                          });
                                        },
                                        child: Material(
                                          elevation: 5,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              height: 90,
                                              decoration: BoxDecoration(
                                                  color: selectedType == index
                                                      ? yellow
                                                      : white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Center(
                                                child: ReusableText(
                                                  reuseText: data
                                                      .productList?[index]
                                                      .productName,
                                                  fSize: 12,
                                                  fColor: black,
                                                  fWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              )),
                                        ),
                                      )),
                            )
                          : const Center(
                              child: ReusableText(
                                reuseText: "ဒေတာ မရှိပါ",
                              ),
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      if(selectedType != null)  const ReusableText(
                        reuseText: "ပမာဏ ရွေးချယ်ရန်",
                        fSize: 16,
                        fWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                      if(selectedType != null) const SizedBox(
                        height: 30,
                      ),
                    if(selectedType != null)  SizedBox(
                        height: 100,
                        child: GridView.builder(
                            itemCount: data.productList?[selectedType??0].measurements?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 4,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectQty = index;
                                    });
                                  },
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                        // padding: EdgeInsets.symmetric(horizontal: 5),
                                        height: 90,
                                        decoration: BoxDecoration(
                                            color: selectQty == index
                                                ? yellow
                                                : white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                          child: ReusableText(
                                            reuseText: data.productList?[selectedType??0].measurements?[index].name
                                                ,
                                            fSize: 12,
                                            fColor: black,
                                            fWeight: FontWeight.bold,
                                            overflow: TextOverflow.visible,
                                          ),
                                        )),
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Consumer<GetProductProvider>(
          builder: (context, value, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ReusableButton(
              onTap: () {
                if (selectQty != null && selectedType != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuyerDetails(
                                phone: value.phone,
                                address: value.address,
                                productsDetails:
                                    value.productList![selectedType ?? 0],
                                measurement:
                                    value.productList?[selectedType??0].measurements![selectQty ?? 0],
                              )));
                } else if (selectQty == null && selectedType != null) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'သတိပြုရန်',
                    desc: 'ကျေးဇူးပြု၍ ပမာဏ အမျိုးအစား ရွေးပေးပါ',
                    // btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                } else if (selectQty != null && selectedType == null) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'သတိပြုရန်',
                    desc: 'ကျေးဇူးပြု၍ ကုန်ပစ္စည်း အမျိုးအစား ရွေးပေးပါ',
                    // btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                } else {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'သတိပြုရန်',
                    desc:
                        'ကျေးဇူးပြု၍ ကုန်ပစ္စည်း နှင့် ပမာဏ အမျိုးအစား ရွေးပေးပါ',
                    // btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              width: MediaQuery.of(context).size.width,
              text: "ဆက်သွားမည်",
              color: green,
              textColor: white,
            ),
          ),
        ),
      ),
    );
  }
}
