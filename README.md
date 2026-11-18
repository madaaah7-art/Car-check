# Car Check | فحص السيارة

أساس تطبيق Flutter متعدد المنصات، **وليس** نظام فحص سيارات مكتملًا. يدعم Android وiOS وWindows وWeb وmacOS وLinux. الواجهة العربية واتجاه RTL هما الافتراضيان، ويمكن التبديل إلى الإنجليزية وLTR من زر الواجهة.

## المتطلبات

- Flutter **3.50.0 stable** مع Dart **3.13** أو إصدار متوافق مع `pubspec.yaml` (استُخدمت قوالب Flutter 3.50.0 الرسمية للمنصات).
- أدوات بناء المنصة المستهدفة: Android SDK وJDK 17 لأندرويد، Xcode على macOS لـ iOS/macOS، Visual Studio مع Desktop development with C++ لويندوز، وGTK/CMake/Ninja على Linux. يمكن تشغيل Web بمتصفح Chrome مدعوم.
- نفّذ `flutter doctor -v` وتحقق من إعدادات المنصة أولًا.

## التثبيت والتشغيل

```bash
git clone https://github.com/madaaah7-art/Car-check.git
cd Car-check
flutter pub get
flutter devices
flutter run -d chrome      # أو استبدل chrome بمعرّف جهاز من flutter devices
```

للبناء حسب المنصة: `flutter build apk` أو `flutter build ios` (على macOS) أو `flutter build windows` (على Windows) أو `flutter build web` أو `flutter build macos` (على macOS) أو `flutter build linux` (على Linux). إعداد التوقيع/النشر النهائي خارج نطاق المرحلة الحالية. استخدم اسم حزمة/معرّف تطبيق خاصًا بك قبل النشر؛ المعرّفات الموجودة أمثلة تأسيسية.

## البنية والقرارات

```text
lib/
  core/l10n/             نصوص عربية/إنجليزية مركزية
  core/state/            إعدادات اللغة والمظهر
  core/theme/            ألوان وخطوط Material 3 للوضعين
  features/home/
    domain/              كيان، عقد مستودع، وحالة استخدام
    data/                تنفيذ مؤقت داخل الذاكرة
    presentation/        متحكم الحالة والواجهة
  app.dart               تركيب التطبيق وحقن المتحكم
  main.dart              نقطة الدخول
android/ ios/ windows/ web/ macos/ linux/  هياكل المنصات
```

إدارة الحالة باستخدام **ChangeNotifier + ListenableBuilder** المدمجين في Flutter: تكفيان لإعدادات اللغة/المظهر وحالة الشاشة الأولية دون اعتماد إضافي، مع إبقاء المتحكمات خلف حدود الميزة وعقود المستودعات قابلة للاختبار والاستبدال. لا توجد قاعدة بيانات أو API أو فحص سيارة فعلي في هذه المرحلة؛ يمكن إضافة طبقات/حل إدارة حالة آخر لاحقًا حين تبرره متطلبات المنتج.

النصوص موجودة في `AppStrings` للعربية والإنجليزية؛ يدير `MaterialApp` اتجاه النص تلقائيًا بحسب locale مع مفوضات `flutter_localizations`. عند اتساع النصوص تُنقل إلى ARB و`gen-l10n`. لا تُضمَّن خطوط خارجية؛ يستخدم التطبيق خطوط النظام الداعمة للعربية، مع مقياس طباعة مركزي في `AppTheme`. الأيقونات في هياكل المنصات عناصر تأسيسية محايدة، وليست هوية بصرية نهائية.

## التحقق

```bash
dart format lib test
flutter analyze
flutter test
```

يتحقق CI من التنسيق والتحليل والاختبارات على Ubuntu عند الدفع أو فتح PR. تحتاج اختبارات البناء والتشغيل على iOS/macOS/Windows إلى مضيف مناسب لكل منصة. ملفات التوقيع والإعدادات المحلية والأسرار مستبعدة من Git؛ لا تضف مفاتيح في المستودع.

## المساهمة

اقرأ [CONTRIBUTING.md](CONTRIBUTING.md) قبل فتح طلب دمج؛ القوالب في `.github/` توضح الحد الأدنى من المعلومات والاختبارات.
