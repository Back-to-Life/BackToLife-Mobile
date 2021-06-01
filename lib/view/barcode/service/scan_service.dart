import 'dart:io';

import 'package:backtolife/core/init/cache/locale_manager.dart';

import '../model/scan_request_model.dart';
import '../model/scan_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'IScanService.dart';

class ScanService extends IScanService {
  ScanService(Dio dio) : super(dio);
  late final String getUnicId = LocaleManager.instance.getUnicId();
  @override
  Future<bool> fetchScanService(ScanRequestModel model) async {
    try {
      final response = await dio.post('${path}/$getUnicId/point',
          data: model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        var responseData = ScanResponseModel.fromJson(response.data);
        if (responseData.success != null) {
          if (responseData.success!) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
