import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class ApiClient extends DioForNative {
  ApiClient() {
     this.options = BaseOptions(
      baseUrl: "http://localhost:3000",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
  }
}