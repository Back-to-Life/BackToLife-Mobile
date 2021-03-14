import 'package:backtolife/core/base/model/base_model.dart';
import 'package:backtolife/core/constants/enum/htpp_request_enum.dart';
import 'package:backtolife/core/init/network/IResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ICoreDio {
 Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, Object> queryParameters,
      void Function(int, int) onReceiveProgress});
}
