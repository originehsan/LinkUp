# Project environment and CI setup

This repository includes recommended environment setup and a CI workflow to make builds reproducible across machines.

Quick local setup (Windows):

- Install Flutter (stable) and add to `PATH`.
- Install JDK 11 and set `JAVA_HOME`.
- Install Android SDK, SDK Command-line Tools, and NDK (side-by-side) via Android Studio SDK Manager.
- Recommended environment variables (set persistently):

```
SETX ANDROID_SDK_ROOT "C:\\Users\\<you>\\AppData\\Local\\Android\\Sdk"
SETX JAVA_HOME "C:\\Program Files\\Java\\jdk-11"
SETX PUB_CACHE "D:\\flutter_pub_cache"    # optional: keep pub cache on same drive as projects
```

If you keep `PUB_CACHE` on the same drive as your projects, Kotlin incremental compilation will not run into cross-drive cache errors.

Install NDK 27 (example):

```powershell
# using sdkmanager (after installing Android SDK command-line tools)
"%LOCALAPPDATA%\Android\Sdk\cmdline-tools\latest\bin\sdkmanager.bat" "ndk;27.0.12077973"
```

If you encounter cross-drive incremental errors (files in `%LOCALAPPDATA%\Pub\Cache` vs project on another drive), either:
- Move the pub cache to the same drive and set `PUB_CACHE` (recommended), or
- Create a junction from the original Pub cache to the new location.

Project notes
- `android/app/build.gradle.kts` pins `ndkVersion` and sets `minSdk` to 23 as required by plugins.
- If you want faster Kotlin builds, enable `kotlin.incremental=true` in `android/gradle.properties` once pub cache and project share a drive.

CI: GitHub Actions
- A workflow is included at `.github/workflows/flutter-ci.yml` to run `flutter pub get`, `flutter analyze`, `flutter test`, and `flutter build` with caching for Pub and Gradle.
# chat_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
