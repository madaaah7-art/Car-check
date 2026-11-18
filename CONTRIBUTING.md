# Contributing

1. Open an issue to agree on scope before adding a new feature or dependency.
2. Keep domain code independent of Flutter and data implementations. Put UI/controllers in `presentation`, contracts and use cases in `domain`, and implementations in `data`.
3. Add Arabic and English strings together in `AppStrings`; use directional Flutter widgets so RTL works.
4. Run `dart format lib test`, `flutter analyze`, and `flutter test` before opening a PR. Include tests for behavior changes.
5. Do not commit credentials, signing files, local configuration, or build output. Review PRs before merging; keep changes small and describe platform impact.
