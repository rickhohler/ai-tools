# CI/CD Standards

This document outlines shared standards for GitHub Actions workflows across all projects.

## Runners

- **macOS/iOS/Swift**: Use `macos-latest` (or pinned version if needed).
- **Python/Web**: Use `ubuntu-latest`.

## Secret Naming

Maintain consistenct secret names across repositories to simplify workflow templating.

- **`GITHUB_TOKEN`**: Automatically provided by GitHub. Use for standard repo operations.
- **`GH_PAT`**: Personal Access Token for cross-repo actions (e.g., publishing docs to another repo).
- **`CODECOV_TOKEN`**: For uploading coverage reports to Codecov.
- **`PYPI_TOKEN`**: For publishing to PyPI (if not using trusted publishing).

## Standard Workflow Steps

1.  **Checkout**: `actions/checkout@v4`
2.  **Setup Environment**: `actions/setup-python@v5` or Xcode selection.
3.  **Resolve Dependencies**: `pip install` or `swift package resolve`.
4.  **Test & Cover**: Run tests with coverage enabled.
5.  **Report**: Upload coverage to Codecov.

## Automation Policy

- **Tests**: Must run on every PR and Push to main/develop.
- **Linting**: Must run on every PR.
- **Publishing**: Triggered by SemVer tags (`v*`).
