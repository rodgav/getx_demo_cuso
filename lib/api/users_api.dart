import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_demo/models/user.dart';

class UsersApi {
  UsersApi._internal();

  static UsersApi _instance = UsersApi._internal();

  static UsersApi get instance => _instance;

  final _dio = Dio();

  Future<UsersModel?> getUsers(int page) async {
    try {
      final response = await this._dio.get('https://reqres.in/api/users',
          queryParameters: {'page': page, 'delay': 5});
      return UsersModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
