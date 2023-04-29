import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/dishes_detail_response_model.dart';

class DishesDetailController extends GetxController{
  Rx<DishesDetailResponseModel> dishesdetaildata = DishesDetailResponseModel().obs;
  @override

  void onInit() {
    super.onInit();
    getdishesdetaildata(refresh: true);
  }

  void getdishesdetaildata({required refresh})  {
    final url = Uri.parse('https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/1');
    final response =  http.get(url).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      dishesdetaildata.value = DishesDetailResponseModel.fromJson(data);
    });

    update();
  }
}