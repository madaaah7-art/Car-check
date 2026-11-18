import 'package:material_ui/material_ui.dart';

import 'core/l10n/app_strings.dart';
import 'core/state/app_settings_controller.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_controller.dart';
import 'features/home/presentation/home_page.dart';

class CarCheckApp extends StatefulWidget {
  const CarCheckApp({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<CarCheckApp> createState() => _CarCheckAppState();
}

class _CarCheckAppState extends State<CarCheckApp> {
  final AppSettingsController settings = AppSettingsController();

  @override
  void dispose() {
    settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: settings,
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.forLocale(settings.locale).title,
          locale: settings.locale,
          supportedLocales: AppStrings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: settings.themeMode,
          home: HomePage(settings: settings, controller: widget.homeController),
        ),
      );
}
