import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enum/htpp_request_enum.dart';
import '../../extension/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part './network_core/core_operations.dart';

/* class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
} */
