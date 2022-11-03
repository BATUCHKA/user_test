import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:user_test/model/user_info_model.dart';

class DioClient {
  Future<List<UserData>?> getUserData() async {
    try {
      final response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");

      final jsonStr = json.encode(response.data);
      final model = (json.decode(jsonStr) as List)
          .map((e) => UserData.fromJson(e))
          .toList();
      return model;
    } on DioError catch (e) {
      return null;
    }
  }
}
