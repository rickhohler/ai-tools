# Language Standards

This directory contains language-specific coding standards. The AI tools system is **language-agnostic** - you can add standards for any programming language your projects use.

## Existing Standards

- **[Python](python.md)** - Black, Ruff, mypy, pytest
- **[Dart/Flutter](dart-flutter.md)** - dart format, flutter analyze, cross-platform mobile/web
- **[Swift/Apple Platforms](swift-apple.md)** - SwiftLint, SwiftFormat, iOS/macOS/watchOS/tvOS

## Adding a New Language

When you work with a new language across multiple projects, create a standard for it:

### Template Structure

```markdown
# [Language] Standards

Brief description of the language and its use cases.

## Tools

List recommended tools:
- Formatter
- Linter
- Type checker (if applicable)
- Package manager
- Build tool

## Quick Setup

Installation commands and basic configuration

## Common Commands

Frequently used commands for:
- Formatting
- Linting
- Testing
- Building

## Code Style

Key style guidelines and best practices

## Project Structure

Recommended directory layout

## Testing

Testing strategy and tools

## Dependencies

How to manage dependencies

## Best Practices

Language-specific tips and patterns
```

### Examples of Additional Languages

Consider adding standards for:

- **JavaScript/TypeScript** - ESLint, Prettier, Jest
- **Go** - gofmt, golangci-lint
- **Java/Kotlin** - ktlint, detekt

### Process

1. Create `docs/standards/language-name.md`
2. Follow the template structure above
3. Include setup instructions, tools, and best practices
4. Reference official style guides where available
5. Update `docs/standards/README.md` (this file)
6. Update main `README.md` to list the new standard
7. Commit with message: `Add [Language] coding standards`

## Language-Specific Project Setup

When setting up a project with a specific language:

1. Run `setup-project.sh` to create config files
2. In the `__ADDITIONAL_RULES__` section, specify:
   - Language and version
   - Which standard to follow
   - Project-specific deviations

Example for a Flutter project:

```markdown
## Project-Specific Rules

- Language: Dart 3.2+ with Flutter 3.16+
- Follow: ~/ai-tools/docs/standards/dart-flutter.md
- State Management: Riverpod (not Provider)
- Target platforms: iOS and Android only (no web/desktop)
- Min iOS: 15.0, Min Android: API 24
```

## Multi-Language Projects

For projects using multiple languages (e.g., Flutter with native iOS/Android code):

```markdown
## Project-Specific Rules

- Primary: Dart/Flutter (see standards/dart-flutter.md)
- iOS native code: Swift (see standards/swift-apple.md)
- Android native code: Kotlin (document standards if added)
- Build scripts: Shell/Bash (follow shell best practices)
```

## Philosophy

The centralized standards should cover:
- **What** tools to use
- **How** to configure them
- **Why** certain patterns are preferred

Project-specific rules handle:
- **Which** version of the language
- **When** to deviate from standards (with rationale)
- **Where** to apply special constraints
