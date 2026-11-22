## 1.0.3

- Boost pub.dev score:
  - Replaced all deprecated `Color.withOpacity(x)` calls by `Color.withValues(alpha: x)` (Flutter 3.27+).
  - Migrated `PopScope.onPopInvoked` to `onPopInvokedWithResult`.
  - Added library-level dartdoc on `custom_story_editor.dart`.
  - Small cleanups (added `const` + missing return type) reported by `dart analyze`.
- Maintainer section translated to English.

## 1.0.2

- README: redesigned Maintainer section — full name, LinkedIn, GitHub, Jov's Inc. (`/blog`), email.

## 1.0.1

- README: removed the pub.dev URL from the H1 title (it was breaking the pub.dev rendering).
- README: removed the Screenshots section whose images were hosted on imgur and had all expired (imgur link rot). To be re-added later with local images (under `assets/`).
- dev: bumped `flutter_lints` 3.0.2 → ^6.0.0.

## 1.0.0

* Initial release of *Custom Story Editor*
