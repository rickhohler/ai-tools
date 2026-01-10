# AI-Assisted Engineering Protocols

**Status**: Public Reference  
**Maintainer**: Rick Hohler

This repository establishes the **engineering standards, configuration patterns, and operational protocols** for AI-assisted software development within my ecosystem. It serves as the authoritative source for optimizing LLM interactions, enforcing code quality, and standardizing toolchain integration across diverse technological domains.

## Architecture

The system utilizes a **hub-and-spoke configuration architecture**:
*   **Central Hub (`ai-tools`)**: Hosts immutable standards, rigorous prompt patterns, and tool-agnostic guidelines.
*   **Project Spokes**: Inherit configurations via lightweight pointers (e.g., `warp.md`, `.cursorrules`) that reference this central truth.

This design ensures all projects—from iOS native applications to distributed backend services—adhere to a unified quality baseline while allowing for domain-specific specialization.

## Capabilities

### 1. Standardization & Compliance
Defines and enforces coding standards across languages, ensuring AI-generated code meets strict quality gates before human review.
- **Swift/Apple**: [Standards & Safety](docs/standards/swift-apple.md)
- **Python**: [Type Systems & Modern Patterns](docs/standards/python.md)
- **Flutter/Dart**: [Cross-Platform Architecture](docs/standards/dart-flutter.md)

### 2. Toolchain Integration
Seamlessly integrates with professional development environments:
*   **Cursor**: Custom rule sets for context-aware coding.
*   **Warp**: AI-enhanced terminal workflows.
*   **Continue**: Local LLM orchestration (Ollama) and VS Code integration.
*   **GitHub Copilot**: Context-anchoring strategies.

### 3. Knowledge Graph
*   [**Patterns**](docs/patterns/): Optimized prompt engineering strategies for complex refactoring, architecture design, and testing.
*   [**Guides**](docs/guides/): Deep-dives into local inference optimization (Ollama), PyPI publishing automation, and legacy tool migrations.

## Usage

### Quick Start (New Project)
Initialize a project with the standardized AI harness:

```bash
~/ai-tools/scripts/setup-project.sh /path/to/project [domain-type]
```

**Domains**: `mobile-app-ios`, `mobile-app-flutter`, `web-app`, `api-service`, `library`.

### Template System
The template engine enforces consistent context interaction rules:
- `__PROJECT_DOMAIN__`: Injects domain-specific architectural constraints (e.g., "Always use MVVM-C for iOS").
- `__STRICT_MODE__`: Enforces type safety and test coverage requirements on all AI outputs.

## Development Journal mechanism
(Internal Use) Time-series tracking of tool efficacy, model hallucinations, and workflow optimizations. Located in `journal/`.

---
*This repository demonstrates a disciplined, expert-led approach to AI leverage—using tools to accelerate architecture and verification, not to replace engineering judgment.*
