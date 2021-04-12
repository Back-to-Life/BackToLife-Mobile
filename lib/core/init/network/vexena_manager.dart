import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager? get instance {
    _instace ??= VexanaManager._init();
    return _instace;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: 'http://10.0.2.2:5000/'));
}
