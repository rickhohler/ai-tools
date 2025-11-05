# Usage Guide

This guide explains how to integrate the centralized AI tools system with your projects.

## Core Concept

Projects maintain **small, lightweight config files** that reference centralized documentation. This creates a single source of truth while allowing project-specific customization.

## Tool-Specific Integration

### Warp Terminal

**File**: `warp.md` in project root

**Purpose**: Human-readable guide for terminal workflows and AI usage patterns

**Setup**:
```bash
~/ai-tools/scripts/setup-project.sh /path/to/project domain
```

**Example**:
```markdown
# Warp AI Project Guide for my-app

> **Centralized Documentation**: `~/ai-tools/docs`

This project references centralized AI tool standards...

## Project-Specific Rules and Notes

- Use PostgreSQL for production database
- Environment variables loaded from .env file only
- API keys must not be committed to repo
```

### Cursor

**File**: `.cursorrules` in project root

**Purpose**: Cursor IDE configuration and rules

**Format**: Mix of YAML-like and markdown

**Example**:
```
# Cursor Rules for my-app

## Documentation Reference
docs_url: ~/ai-tools/docs

## Shared Standards
- ~/ai-tools/docs/standards
- ~/ai-tools/docs/patterns

## Project-Specific Rules
- PostgreSQL for production
- Environment variables from .env only
```

### Continue (VS Code)

**File**: `.continue-config` in project root

**Purpose**: Continue extension configuration

**Format**: JSON

**Example**:
```json
{
  "project": {
    "name": "my-app",
    "path": "/Users/you/projects/my-app",
    "domain": "web-app"
  },
  "references": [
    "~/ai-tools/docs/standards",
    "~/ai-tools/docs/patterns"
  ]
}
```

### GitHub Copilot

**No dedicated config file** - Use in-code comments and documentation links

**Example**:
```python
# Reference: ~/ai-tools/docs/standards/python.md
# This module follows centralized Python standards

def process_data():
    """Process data according to standards."""
    pass
```

## Applying Templates

### Automated Setup

Use the setup script:

```bash
~/ai-tools/scripts/setup-project.sh PROJECT_PATH [DOMAIN] [DOCS_PATH]
```

**Arguments**:
- `PROJECT_PATH` (required): Absolute path to project
- `DOMAIN` (optional): Project domain/category
- `DOCS_PATH` (optional): Override centralized docs path

**Example**:
```bash
~/ai-tools/scripts/setup-project.sh \
  ~/projects/my-app \
  web-app
```

### Manual Setup

1. Copy templates from `templates/` directory
2. Remove `.template` extension
3. Replace placeholders manually:
   - `__CENTRAL_DOCS__` → `~/ai-tools/docs`
   - `__PROJECT_NAME__` → Your project name
   - `__PROJECT_PATH__` → Absolute project path
   - `__PROJECT_DOMAIN__` → Project category
   - `__ADDITIONAL_RULES__` → Project-specific rules

## Project-Specific Overrides

### When to Override

Add project-specific rules when:
- Project has unique data constraints
- Domain-specific patterns apply
- Tool configuration needs customization
- Breaking with shared standards (document why!)

### How to Override

Replace `__ADDITIONAL_RULES__` placeholder with your rules:

**Good Example**:
```markdown
## Project-Specific Rules

- PostgreSQL required for production database
- Redis for caching layer
- Use pytest for testing (project requirement)
- API keys loaded from .env file only
```

**Bad Example** (too generic):
```markdown
## Project-Specific Rules

- Write good code
- Follow best practices
```

### Documenting Conflicts

If overriding shared standards, document why in project README:

```markdown
## AI Tool Configuration

This project uses centralized standards from `~/ai-tools`
with the following exceptions:

- Uses 100-char line length (vs 88) for readability in data files
- Disables mypy strict mode due to legacy code constraints
```

## Referencing Patterns and Standards

### In Prompts

When working with AI tools, reference centralized docs:

```
"Follow the Python standards at ~/ai-tools/docs/standards/python.md
for this refactoring"
```

### In Code Comments

```python
# Follows: ~/ai-tools/docs/patterns/error-handling.md
try:
    result = process_data()
except DataError as e:
    logger.error(f"Processing failed: {e}")
```

### In Documentation

```markdown
## Development Guidelines

This project follows centralized standards:
- [Python Standards](~/ai-tools/docs/standards/python.md)
- [Testing Patterns](~/ai-tools/docs/patterns/testing.md)
```

## Maintenance

### Updating Project Configs

When centralized standards change:

1. Check if project config needs updates
2. Review `__ADDITIONAL_RULES__` for conflicts
3. Update project config if needed
4. Document changes in project changelog

### Adding New Projects

```bash
# Setup new project
~/ai-tools/scripts/setup-project.sh ~/new-project project-type

# Customize rules
edit ~/new-project/warp.md
edit ~/new-project/.cursorrules
edit ~/new-project/.continue-config

# Commit
cd ~/new-project
git add warp.md .cursorrules .continue-config
git commit -m "Add AI tool configurations"
```

## Tips

- Keep `__ADDITIONAL_RULES__` concise and specific
- Reference commit hashes when documenting exceptions
- Update centralized docs for patterns used across multiple projects
- Use journal to track what works and what doesn't
- Review project configs during code reviews
