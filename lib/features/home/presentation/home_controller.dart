import 'package:flutter/foundation.dart';

import '../domain/app_status.dart';
import '../domain/get_app_status.dart';

enum HomeLoadState { loading, ready, failure }

class HomeController extends ChangeNotifier {
  HomeController(this._getStatus);

  final GetAppStatus _getStatus;
  HomeLoadState _state = HomeLoadState.loading;
  HomeLoadState get state => _state;

  Future<void> load() async {
    _state = HomeLoadState.loading;
    notifyListeners();
    try {
      final status = await _getStatus();
      _state = status == AppStatus.ready
          ? HomeLoadState.ready
          : HomeLoadState.failure;
    } catch (_) {
      _state = HomeLoadState.failure;
    }
    notifyListeners();
  }
}
