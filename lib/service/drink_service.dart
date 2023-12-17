import 'package:dio/dio.dart';
import '/helpers/api_client.dart';
import '/model/drink_model.dart';

class ApiHelper {
  //LISTDATA
  Future<List<Drink>> listData() async {
    final Response response = await ApiClient().get('drink');
    final List data = response.data as List;
    List<Drink> result = data.map((json) => Drink.fromJson(json)).toList();
    return result;
  }

  //GET DIO
  Future<Drink> getById(String id) async {
    final Response response = await ApiClient().get('drink/${id}');
    Drink result = Drink.fromJson(response.data);
    return result;
  }

  //POST DIO
  Future<Drink> simpan(Drink drink) async {
    var data = drink.toJson();
    final Response response = await ApiClient().post('drink', data);
    Drink result = Drink.fromJson(response.data);
    return result;
  }

  //PUT DIO
  Future<Drink> ubah(Drink drink, String id) async {
    var data = drink.toJson();
    final Response response = await ApiClient().put('drink/${id}', data);
    print(response);
    Drink result = Drink.fromJson(response.data);
    return result;
  }

  // DELETE
  Future<Drink> hapus(Drink drink) async {
    final Response response = await ApiClient().delete('drink/${drink.id}');
    Drink result = Drink.fromJson(response.data);
    return result;
  }
}
