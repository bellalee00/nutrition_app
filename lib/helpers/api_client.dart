import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://65736304192318b7db420acf.mockapi.io/',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000)));

class ApiClient {
  Future<Response> get(String Path) async {
    try {
      final Response = await dio.get(Uri.encodeFull(Path));
      return Response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
