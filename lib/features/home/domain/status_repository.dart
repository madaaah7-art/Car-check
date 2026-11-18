import 'app_status.dart';

abstract interface class StatusRepository {
  Future<AppStatus> getStatus();
}
