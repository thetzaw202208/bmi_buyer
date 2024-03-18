import 'package:bmi_buyer/data/network/data_agents/get_order_list/get_order_list_data_agent.dart';
import 'package:bmi_buyer/data/response_vo/order_list_response_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/data_agents/get_order_list/get_order_list_data_agent_impl.dart';

class GetOrderListProvider extends ChangeNotifier{
  int id=1;
  GetOrderListDataAgent getOrderListDataAgent=GetOrderListDataAgentImpl();
List<OrderListData>? orderList=[];
GetOrderListProvider(){
  getOrderList();
  notifyListeners();
}
  getOrderList()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt("buyer_id") ?? 1;
    getOrderListDataAgent.getOrderList(id).then((value) {
      if(value.code==200){
        orderList=value.data;
        notifyListeners();
      }

    });

  }

}