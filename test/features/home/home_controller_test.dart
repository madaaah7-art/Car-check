import 'package:car_check/features/home/domain/app_status.dart';
import 'package:car_check/features/home/domain/get_app_status.dart';
import 'package:car_check/features/home/domain/status_repository.dart';
import 'package:car_check/features/home/presentation/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeStatusRepository implements StatusRepository {
  @override
  Future<AppStatus> getStatus() async => AppStatus.ready;
}

void main() {
  test('loads status through domain use case', () async {
    final controller = HomeController(GetAppStatus(FakeStatusRepository()));
    addTearDown(controller.dispose);
    expect(controller.state, HomeLoadState.loading);
    await controller.load();
    expect(controller.state, HomeLoadState.ready);
  });
}
