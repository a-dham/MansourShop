import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response?> getData({
    required String url,
    required Map<String, dynamic>? queryParameters,
  }) async {
    return await dio?.get(url, queryParameters: queryParameters);
  }

  Future<Response?> postData({
    required String url,
    required Map<String, dynamic>? data,
    @required Map<String, dynamic>? queryParameters,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {'lang': lang, 'Authorization': token};

    return await dio?.post(url, data: data, queryParameters: queryParameters);
  }
}
