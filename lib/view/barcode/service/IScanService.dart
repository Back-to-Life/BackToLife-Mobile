import '../model/scan_request_model.dart';
import '../model/scan_response_model.dart';
import 'package:dio/dio.dart';

abstract class IScanService {
  final Dio dio;
  final String path = 'users';

  IScanService(this.dio);

  Future<bool> fetchScanService(ScanRequestModel model);
}
