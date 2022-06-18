import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mansour_shop/network/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
    String lang = 'en',
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio?.get(url, queryParameters: queryParameters);
  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic>? data,
    @required Map<String, dynamic>? queryParameters,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json'
    };

    return await dio?.post(url, data: data, queryParameters: queryParameters);
  }
}
