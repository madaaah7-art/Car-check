import 'package:car_check/app.dart';
import 'package:car_check/features/home/domain/get_app_status.dart';
import 'package:car_check/features/home/data/in_memory_status_repository.dart';
import 'package:car_check/features/home/presentation/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Arabic RTL by default and switches to English LTR', (tester) async {
    final controller = HomeController(GetAppStatus(InMemoryStatusRepository()));
    addTearDown(controller.dispose);
    await controller.load();
    await tester.pumpWidget(CarCheckApp(homeController: controller));
    expect(find.text('مرحبًا بك في فحص السيارة'), findsOneWidget);
    expect(tester.widget<Directionality>(find.byType(Directionality).first).textDirection,
        TextDirection.rtl);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome to Car Check'), findsOneWidget);
    expect(tester.widget<Directionality>(find.byType(Directionality).first).textDirection,
        TextDirection.ltr);
  });
}
