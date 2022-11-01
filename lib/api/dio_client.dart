import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:user_test/model/user_info_model.dart';

class DioClient {
  Future<UserData?> getUserData() async {
    UserData? userDataNew;

    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      userDataNew = UserData.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString().toUpperCase());
      return null;
    }
    return userDataNew;
  }
}
