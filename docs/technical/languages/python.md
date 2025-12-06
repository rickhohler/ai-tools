# Python Coding Standards

This document centralizes Python coding standards for all projects.

## Tools

Maintain consistent code quality with these tools:

- **Formatter**: [Black](https://black.readthedocs.io/)
- **Import sorter**: [isort](https://pycqa.github.io/isort/) (or Ruff's isort compatibility)
- **Linter**: [Ruff](https://docs.astral.sh/ruff/)
- **Type checker**: [mypy](https://mypy.readthedocs.io/) (for stricter projects)

## Quick Setup

```bash
# Install via pipx (recommended)
pipx install black
pipx install ruff
pipx install isort
pipx install mypy

# Or via pip in your project venv
pip install black ruff isort mypy
```

## Common Commands

```bash
# Format code
black .
ruff format .

# Check for issues
ruff check .

# Sort imports
isort .

# Type checking
mypy .
```

## Pre-commit Hooks

Consider using [pre-commit](https://pre-commit.com/) hooks for automated checks.

## Code Style and Formatting

- Follow PEP 8 guidelines
- Use Black's default line length (88 characters)
- Prefer explicit over implicit

## Type Hints

- Use type hints for function signatures
- Consider stricter typing for critical code paths
- Run mypy on projects requiring high reliability

## Testing Strategy

- Write unit tests for core functionality
- Aim for meaningful test coverage (not just high percentages)
- Use pytest as the default testing framework

## Dependency Management

- Use virtual environments for all projects
- Pin dependencies in requirements.txt or pyproject.toml
- Consider using poetry or pipenv for complex projects

## Packaging and Versioning

- Follow semantic versioning (SemVer)
- Include a README.md with usage instructions
- Document breaking changes clearly
