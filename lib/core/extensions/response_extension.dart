import 'package:dio/dio.dart';

extension CodeCheck on Response<dynamic> {
  bool isSuccessRequest() {
    return statusCode == 200;
  }
}
