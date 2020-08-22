import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:mofud/constants/api_endpoints.dart';

class ApiClient extends DioForNative {
  ApiClient() {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json'
      };

     this.options = BaseOptions(
      baseUrl: AppApiEndpoints.base,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );
  }
}