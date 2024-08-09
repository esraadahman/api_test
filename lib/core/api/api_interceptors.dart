import 'package:apiiiiiiiiiiiiii/cache/cache_healper.dart';
import 'package:apiiiiiiiiiiiiii/core/api/endPointes.dart';
import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  // send header with request
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers['accept_ language'] = "en";
    // options.headers['Authorization'] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //         ? "${CacheHelper().getData(key: ApiKey.token)}"
    //         : null;

    final token = CacheHelper().getData(key: ApiKey.token);
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  // 'Authorization': 'Bearer $token',
}
