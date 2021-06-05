import '../../../core/extension/string_extension.dart';

class LottiePaths {
  static LottiePaths? _instance;
  static LottiePaths get instance {
    _instance ??= LottiePaths._init();

    return _instance!;
  }

  LottiePaths._init();

  final loadingPageContainer = 'loadingpageLottie'.toLottie;
  final loginPageLottie = 'loginPageLottie'.toLottie;
  final errorLottie = 'errorLottie'.toLottie;
  final nointernetconnection = 'nointernetconnection'.toLottie;
  final tryAgain = 'try-again-opps'.toLottie;
  final barcodeScan = 'barcode-scan'.toLottie;
  final darkModeFirst = 'dark-mode-first-open'.toLottie;
  final qrCodeError = 'qr-code-check'.toLottie;
  final pushNotificationSuccess = 'push-notification-success'.toLottie;
  final forgotPassword = 'forgot-password'.toLottie;
  final passwordChange = 'password-change'.toLottie;
}
