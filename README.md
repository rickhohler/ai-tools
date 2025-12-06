# AI Tools

Centralized documentation for AI-assisted coding tools, standards, patterns, and personal observations. This repository serves as the single source of truth for all AI tool configurations across projects.

## Overview

This system uses a **reference-based approach**: projects contain minimal configuration files (warp.md, .cursorrules, .continue-config) that point back to this centralized documentation. This ensures consistency across projects while allowing project-specific overrides.

## Table of Contents

- [Directory Structure](#directory-structure)
- [Quick Start](#quick-start)
- [Using Templates](#using-templates)
- [Documentation](#documentation)
- [Maintenance](#maintenance)

## Directory Structure

```
ai-tools/
├── docs/
│   ├── technical/       # Objective technical standards
│   │   ├── languages/   # Language specifics (Python, etc.)
│   │   ├── idioms/      # General technical patterns (API Design, Reusability)
│   │   ├── process/     # Process standards (Commit Workflow, Testing)
│   │   └── standards/   # Core standards (Security, CoC)
│   ├── preferences/     # Subjective style & choices
│   ├── patterns/        # Prompt patterns and AI workflows (Code patterns go to DesignAlgorithmsKit)
│   ├── guides/          # Tool-specific guides (Ollama, etc.)
│   ├── USAGE.md         # How to integrate with projects
│   └── MAINTENANCE.md   # System maintenance guide
├── templates/           # Config templates for projects
│   ├── warp.md.template
│   ├── .cursorrules.template
│   ├── .continue-config.template
│   ├── .github-copilot.template
│   └── .openai-codex.template
├── scripts/
│   ├── setup-project.sh # Initialize project with templates
│   └── setup-project.sh # Initialize project with templates
└── README.md            # This file
```

## Quick Start

### For New Projects

1. Run the setup script with your project path:

```bash
~/ai-tools/scripts/setup-project.sh /path/to/project project-domain
```

Example:
```bash
~/ai-tools/scripts/setup-project.sh ~/projects/my-app web-app
```

Common project domains:
- `web-app` - Web applications
- `mobile-app-flutter` - Flutter cross-platform mobile apps
- `mobile-app-ios` - Native iOS apps (Swift/SwiftUI)
- `mobile-app-android` - Native Android apps (Kotlin/Jetpack Compose)
- `cli-tool` - Command-line tools
- `library` - Shared libraries or packages
- `api-service` - Backend API services
- `data-science` - Data analysis/ML projects
- `desktop-app` - Desktop applications

2. Edit the generated files (warp.md, .cursorrules, .continue-config) and replace `__ADDITIONAL_RULES__` with project-specific rules.

### For Existing Projects

Add references to centralized docs in your existing config files. See [docs/USAGE.md](docs/USAGE.md) for details.

## Using Templates

Templates use these placeholders:

- `__CENTRAL_DOCS__` - Path to centralized docs (default: `~/ai-tools/docs`)
- `__PROJECT_NAME__` - Project name (derived from directory)
- `__PROJECT_PATH__` - Absolute path to project
- `__PROJECT_DOMAIN__` - Project category/type (e.g., web-app, mobile-app-flutter, mobile-app-ios, mobile-app-android, cli-tool, library, api-service, data-science, desktop-app)
- `__ADDITIONAL_RULES__` - Project-specific rules (you fill this in)

The setup script automatically replaces placeholders except `__ADDITIONAL_RULES__`, which you customize manually.

## Documentation

### Standards

Language-specific coding standards:

- [Python](docs/technical/languages/python.md) - Black, Ruff, mypy, pytest
- [Dart/Flutter](docs/technical/languages/dart-flutter.md) - dart format, flutter analyze, cross-platform
- [Swift/Apple](docs/technical/languages/swift-apple.md) - SwiftLint, SwiftFormat, iOS/macOS/watchOS

The system is language-agnostic - add standards for any language your projects use.

### Technical Standards

- **Process**
    - **[Commit Workflow](docs/technical/process/commit-workflow.md)**: Conventional commits and branch strategies.
    - **[Issue Tracking](docs/technical/process/issue-tracking.md)**: Standard labels and milestones.
    - **[Semantic Versioning](docs/technical/process/versioning.md)**: Rules for versioning and tagging.
    - **[Testing Standards](docs/technical/process/testing-standards.md)**: Testing/Mocking strategies and coverage goals.
    - [CI/CD Standards](docs/technical/ci-cd.md) - Workflows & Secrets

- **Idioms & Design**
    - [API Design](docs/technical/idioms/api-design.md) - Facades & Protocols
    - [Reusability](docs/technical/idioms/reusability.md) - Composition & Design Checklist
    - [FeatureFlagKit Policy](docs/technical/idioms/feature-flag-kit.md) - Feature toggle standards
    - [FileSystemKit Policy](docs/technical/idioms/file-system-kit.md) - File system operation standards
    - [DesignAlgorithmsKit](docs/technical/idioms/design-algorithms-kit.md) - Design patterns policy
    
- **Core Standards**
    - [Security Policy](docs/technical/standards/security.md)
    - [Code of Conduct](docs/technical/standards/code-of-conduct.md)
    - [Swift Package Guide](docs/technical/languages/swift-package-guide.md)

### Guides

- [Swift Package Guide](docs/technical/languages/swift-package-guide.md) - Repository standards and CI/CD
- [Ollama Local Setup](docs/guides/ollama-guide.md) - Local LLM setup with Continue
- [OpenAI Codex](docs/guides/openai-codex.md) - Codex evolution: original API (deprecated 2023) and new suite (2024-2025)
- [Python Library Packaging](docs/guides/python-library-packaging.md) - PyPI publishing with GitHub Actions automation

### Usage

- [Project Integration Guide](docs/USAGE.md) - How to use this system
- [Maintenance Guide](docs/MAINTENANCE.md) - Updating and evolving the system

## Supported Tools

- **Warp Terminal** - Uses `warp.md` in project root
- **Cursor** - Uses `.cursorrules` in project root
- **Continue (VS Code)** - Uses `.continue-config` in project root
- **GitHub Copilot** - Uses `.github-copilot` in project root with in-code comment references
- **OpenAI Codex (VS Code)** - Uses `.openai-codex` in project root (requires ChatGPT Plus/Pro/Business/Enterprise)

## Maintenance

See [docs/MAINTENANCE.md](docs/MAINTENANCE.md) for:
- Adding/updating standards and patterns
- Template evolution
- Version management
