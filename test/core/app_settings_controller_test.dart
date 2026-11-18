import 'package:car_check/core/state/app_settings_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Arabic is default and English can be selected', () {
    final settings = AppSettingsController();
    addTearDown(settings.dispose);
    expect(settings.locale, const Locale('ar'));
    settings.setLocale(const Locale('en'));
    expect(settings.locale, const Locale('en'));
    settings.setLocale(const Locale('fr'));
    expect(settings.locale, const Locale('en'));
  });
}
