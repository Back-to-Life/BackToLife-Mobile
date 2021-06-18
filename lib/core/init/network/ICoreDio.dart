import '../../base/model/base_model.dart';
import '../../constants/enum/htpp_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
