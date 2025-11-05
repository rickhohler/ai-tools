# Dart and Flutter Standards

This document centralizes Dart and Flutter coding standards for all projects.

## Tools

Maintain consistent code quality with these tools:

- **Formatter**: `dart format` (built-in)
- **Linter**: `dart analyze` with Flutter lints
- **Package manager**: `pub` / `flutter pub`

## Quick Setup

```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    - prefer_const_constructors
    - prefer_const_literals_to_create_immutables
    - avoid_print
    - always_declare_return_types
```

```bash
# Install dependencies
flutter pub get

# Format code
dart format .

# Analyze code
flutter analyze

# Run tests
flutter test
```

## Common Commands

```bash
# Format
dart format lib/

# Analyze
flutter analyze

# Test
flutter test

# Build
flutter build ios
flutter build apk
flutter build web
```

## Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `const` constructors where possible
- Prefer composition over inheritance
- Use meaningful widget names

## Project Structure

```
lib/
├── main.dart
├── models/
├── screens/
├── widgets/
├── services/
└── utils/
```

## State Management

Document your choice in project-specific rules:
- Provider
- Riverpod
- Bloc
- GetX
- setState (for simple cases)

## Testing

- Unit tests in `test/`
- Widget tests for UI components
- Integration tests in `integration_test/`
- Aim for >70% coverage on business logic

## Platform-Specific

### iOS
- Configure `ios/Runner.xcodeproj` for signing
- Set deployment target in `ios/Podfile`
- Use `CocoaPods` for native dependencies

### Android
- Configure `android/app/build.gradle`
- Set minSdkVersion appropriately
- Handle permissions in AndroidManifest.xml

### Web
- Configure `web/index.html`
- Use responsive design
- Test on multiple browsers

## Dependencies

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  # Pin major versions
  http: ^1.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## Best Practices

- Use null safety (`int?`, `String?`)
- Avoid deeply nested widgets (extract to methods/classes)
- Use `const` where possible for performance
- Handle async operations properly with `FutureBuilder` or async/await
- Dispose controllers and streams
