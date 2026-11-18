import 'app_status.dart';
import 'status_repository.dart';

class GetAppStatus {
  const GetAppStatus(this.repository);

  final StatusRepository repository;

  Future<AppStatus> call() => repository.getStatus();
}
