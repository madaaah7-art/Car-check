import '../domain/app_status.dart';
import '../domain/status_repository.dart';

/// Replace with a real data source when a product requirement is defined.
class InMemoryStatusRepository implements StatusRepository {
  @override
  Future<AppStatus> getStatus() async => AppStatus.ready;
}
