import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static Init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.escuelajs.co',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
    };
    return await dio.get(url, queryParameters: query);
  }
}
