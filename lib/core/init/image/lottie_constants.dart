import '../../../core/extension/string_extension.dart';

class LottiePaths {
  static LottiePaths _instace;
  static LottiePaths get instance {
    if (_instace == null) _instace = LottiePaths._init();
    return _instace;
  }

  LottiePaths._init();

  final loadingPageContainer = 'loadingpage'.toLottie;
}
