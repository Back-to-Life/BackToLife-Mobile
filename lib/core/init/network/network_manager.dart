import 'dart:io';

import 'ICoreDio.dart';
import 'core_dio.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    );
    late Dio _dio;

/*     Future dioGet<T extends BaseModel>(String path, T model) async {
      final response = await _dio.get(path);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (responseBody is List) {
            return responseBody.map((e) => model.fromJson(e)).toList();
          } else if (responseBody is Map) {
            return model.fromJson(responseBody as Map<String, Object>);
          }
          return responseBody;
          break;
        default:
      }
    } */
  }
}
