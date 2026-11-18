import 'package:flutter/widgets.dart';

import 'app.dart';
import 'features/home/data/in_memory_status_repository.dart';
import 'features/home/domain/get_app_status.dart';
import 'features/home/presentation/home_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    CarCheckApp(
      homeController: HomeController(GetAppStatus(InMemoryStatusRepository()))
        ..load(),
    ),
  );
}
