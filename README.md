# AI Tools

Centralized documentation for AI-assisted coding tools, standards, patterns, and personal observations. This repository serves as the single source of truth for all AI tool configurations across projects.

## Overview

This system uses a **reference-based approach**: projects contain minimal configuration files (warp.md, .cursorrules, .continue-config) that point back to this centralized documentation. This ensures consistency across projects while allowing project-specific overrides.

## Table of Contents

- [Directory Structure](#directory-structure)
- [Quick Start](#quick-start)
- [Using Templates](#using-templates)
- [Journaling](#journaling)
- [Documentation](#documentation)
- [Maintenance](#maintenance)

## Directory Structure

```
ai-tools/
├── docs/
│   ├── standards/       # Coding standards (Python, etc.)
│   ├── patterns/        # Prompt patterns and AI workflows
│   ├── guides/          # Tool-specific guides (Ollama, etc.)
│   ├── USAGE.md         # How to integrate with projects
│   └── MAINTENANCE.md   # System maintenance guide
├── templates/           # Config templates for projects
│   ├── warp.md.template
│   ├── .cursorrules.template
│   └── .continue-config.template
├── journal/
│   └── YYYY/            # Daily files: MM-DD.md
├── scripts/
│   ├── setup-project.sh # Initialize project with templates
│   └── journal.sh       # Quick journal entries helper
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
- `mobile-app` - Mobile applications (iOS/Android/Flutter)
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
- `__PROJECT_DOMAIN__` - Project category/type (e.g., web-app, mobile-app, cli-tool, library, api-service, data-science, desktop-app)
- `__ADDITIONAL_RULES__` - Project-specific rules (you fill this in)

The setup script automatically replaces placeholders except `__ADDITIONAL_RULES__`, which you customize manually.

## Journaling

Track your personal observations and learnings about AI tool usage:

**Format**: `journal/YYYY/MM-DD.md`

**Quick entry**:
```bash
~/ai-tools/scripts/journal.sh Your observation here
```

**Manual entry**: Edit today's file directly

**Note**: Journal is for your personal thoughts only - not for automated logging.

See [journal/README.md](journal/README.md) for details.

## Documentation

### Standards

Language-specific coding standards:

- [Python](docs/standards/python.md) - Black, Ruff, mypy, pytest
- [Dart/Flutter](docs/standards/dart-flutter.md) - dart format, flutter analyze, cross-platform
- [Swift/Apple](docs/standards/swift-apple.md) - SwiftLint, SwiftFormat, iOS/macOS/watchOS

The system is language-agnostic - add standards for any language your projects use.

### Guides

- [Ollama Local Setup](docs/guides/ollama-guide.md) - Local LLM setup with Continue

### Usage

- [Project Integration Guide](docs/USAGE.md) - How to use this system
- [Maintenance Guide](docs/MAINTENANCE.md) - Updating and evolving the system

## Supported Tools

- **Warp Terminal** - Uses `warp.md` in project root
- **Cursor** - Uses `.cursorrules` in project root
- **Continue (VS Code)** - Uses `.continue-config` in project root
- **GitHub Copilot** - Use in-code comments and links to centralized docs

## Maintenance

See [docs/MAINTENANCE.md](docs/MAINTENANCE.md) for:
- Adding/updating standards and patterns
- Template evolution
- Version management
- Journal housekeeping
