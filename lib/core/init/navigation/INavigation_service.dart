abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
  // Future<String> navigateToPageReturnString({String? path, Object? data});
}
