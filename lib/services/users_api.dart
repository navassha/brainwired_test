import 'dart:convert';
import 'dart:developer';

import 'package:brain_wired_mechine_test/model/api_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  Future<List<UserModel>?> getUsers() async {
    const String path = "/users";
    Response response = await dio.get(path);

    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return userModelFromJson(json);
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
