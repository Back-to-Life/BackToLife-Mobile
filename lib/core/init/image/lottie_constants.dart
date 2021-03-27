import '../../../core/extension/string_extension.dart';

class LottiePaths {
  static LottiePaths _instace;
  static LottiePaths get instance {
    _instace ??= LottiePaths._init();
    return _instace;
  }

  LottiePaths._init();

  final loadingPageContainer = 'loadingpageLottie'.toLottie;
  final loginPageLottie = 'loginPageLottie'.toLottie;
  final errorLottie = 'errorLottie'.toLottie;
}
