import 'package:flutter/widgets.dart';

/// Small, explicit catalog for the starter screen. Move to ARB/gen-l10n when
/// translations grow; keep all user-facing text here rather than in widgets.
class AppStrings {
  const AppStrings._(this.isArabic);

  final bool isArabic;

  static const supportedLocales = [Locale('ar'), Locale('en')];

  static AppStrings forLocale(Locale locale) =>
      AppStrings._(locale.languageCode == 'ar');

  String get title => isArabic ? 'فحص السيارة' : 'Car Check';
  String get welcome =>
      isArabic ? 'مرحبًا بك في فحص السيارة' : 'Welcome to Car Check';
  String get foundation => isArabic
      ? 'مشروع متعدد المنصات جاهز للبناء عليه.'
      : 'A cross-platform foundation ready to build on.';
  String get ready => isArabic ? 'الأساس جاهز' : 'Foundation ready';
  String get loading => isArabic ? 'جارٍ التحميل' : 'Loading';
  String get failure =>
      isArabic ? 'تعذر تحميل الحالة' : 'Could not load status';
  String get retry => isArabic ? 'إعادة المحاولة' : 'Retry';
  String get switchLanguage => isArabic ? 'English' : 'العربية';
  String get switchTheme => isArabic ? 'تغيير المظهر' : 'Change theme';
}
