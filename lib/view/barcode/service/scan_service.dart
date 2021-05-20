import 'dart:io';

import 'package:backtolife/view/barcode/model/scan_request_model.dart';
import 'package:backtolife/view/barcode/model/scan_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'IScanService.dart';

class ScanService extends IScanService {
  ScanService(Dio dio) : super(dio);

  @override
  Future<bool> fetchScanService(ScanRequestModel model) async {
    try {
      final response = await dio.post('${path}/609fccfac1b2200658fa4b05/point',
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
