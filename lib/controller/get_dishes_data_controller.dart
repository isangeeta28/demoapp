import 'dart:convert';

import 'package:get/get.dart';

import '../model/dishes_response_model.dart';
import 'package:http/http.dart' as http;

class DishesDataController extends GetxController{
  Rx<DishesResponseModel> dishesdata = DishesResponseModel().obs;
  @override

  void onInit() {
    super.onInit();
    getdishesdata(refresh: true);
  }

  void getdishesdata({required refresh})  {
    final url = Uri.parse('https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/');
    final response =  http.get(url).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      dishesdata.value = DishesResponseModel.fromJson(data);
    });

    update();
  }
}