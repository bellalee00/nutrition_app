import 'package:dio/dio.dart';
import '/helpers/api_client.dart';
import '/model/food_model.dart';

class ApiHelper {
  //LISTDATA
  Future<List<Food>> listData() async {
    final Response response = await ApiClient().get('food');
    final List data = response.data as List;
    List<Food> result = data.map((json) => Food.fromJson(json)).toList();
    return result;
  }

  //GET DIO
  Future<Food> getById(String id) async {
    final Response response = await ApiClient().get('food/${id}');
    Food result = Food.fromJson(response.data);
    return result;
  }

  //POST DIO
  Future<Food> simpan(Food food) async {
    var data = food.toJson();
    final Response response = await ApiClient().post('food', data);
    Food result = Food.fromJson(response.data);
    return result;
  }

  // PUT
  Future<Food> updateFood(Food poli, String id) async {
    var data = poli.toJson();
    final Response response = await ApiClient().put('food/${id}', data);
    print(response);
    Food result = Food.fromJson(response.data);
    return result;
  }

  //PUT DIO
  Future<Food> ubah(Food food, String id) async {
    var data = food.toJson();
    final Response response = await ApiClient().put('food/${id}', data);
    print(response);
    Food result = Food.fromJson(response.data);
    return result;
  }

  // DELETE
  Future<Food> hapus(Food food) async {
    final Response response = await ApiClient().delete('food/${food.id}');
    Food result = Food.fromJson(response.data);
    return result;
  }
}
