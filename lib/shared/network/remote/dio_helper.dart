import 'package:dio/dio.dart';

import '../../constants.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '$baseURL/',
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic> ?query,
    String lang = 'en',
    String ?token,
  }) async {
    dio.options.headers = {
      //"accept": 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
     Map<String, dynamic> ?query,
     required Map<String, dynamic> data,
     String lang = 'en',
     String ?token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic> ?query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String ?token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization': token??'',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }



}
