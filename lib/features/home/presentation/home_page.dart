import 'package:material_ui/material_ui.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/state/app_settings_controller.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.settings, required this.controller});

  final AppSettingsController settings;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.forLocale(settings.locale);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
        actions: [
          TextButton(
            onPressed: () => settings.setLocale(
              Locale(settings.locale.languageCode == 'ar' ? 'en' : 'ar'),
            ),
            child: Text(strings.switchLanguage),
          ),
          IconButton(
            tooltip: strings.switchTheme,
            onPressed: settings.toggleTheme,
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.directions_car_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    strings.welcome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    strings.foundation,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  if (controller.state == HomeLoadState.loading)
                    const CircularProgressIndicator()
                  else if (controller.state == HomeLoadState.ready)
                    Text(strings.ready)
                  else ...[
                    Text(strings.failure),
                    TextButton(
                      onPressed: controller.load,
                      child: Text(strings.retry),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
