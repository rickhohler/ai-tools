# Swift Package Guide

This document outlines the requirements and standards for Swift Packages in our ecosystem.

## Repository Types

### Public Repositories
- **Visibility**: Public (GitHub)
- **Contribution Policy**: Internal contributor only. External PRs are not accepted at this time.
- **Required Files**:
    - `README.md`
    - `LICENSE` (Apache 2.0 or MIT)
    - `CONTRIBUTING.md`: explicitly stating "Internal contributor only".
    - `Package.swift`
    - `.gitignore` (Standard Swift)
    - `.github/workflows/` (Tests, Docs)

### Private Repositories
- **Visibility**: Private
- **Required Files**:
    - `README.md`
    - `Package.swift`
    - `.gitignore`

## CLI Tools
**GitHub CLI (`gh`) Usage**:
When using the `gh` command to create or manage repositories, always ensure you are using the username that matches the `ai-tools` repository owner (e.g., `rickhohler`).
```bash
# Example
gh repo create rickhohler/my-new-repo --private
```

## Required Files Details

### CONTRIBUTING.md (Public Repo)
Must contain:
```markdown
# Contributing

**Note**: This project is currently maintained by internal contributors only. 
We are not accepting external pull requests at this time.
```

### GitHub Actions Workflows
### CI/CD

Standard templates are available in `ai-tools/templates/workflows/swift/`.

1.  **Unit Tests** (`tests.yml`): Runs tests and uploads coverage to Codecov.
    - Requires: `CODECOV_TOKEN` secret.

2.  **Documentation** (`docs.yml`): Builds DocC documentation and publishes it to `rickhohler.github.io`.
    - Requires: `GH_PAT` (Personal Access Token) with `repo` scope to push to the documentation repository.
    - Publishes to: `https://rickhohler.github.io/docs/<PackageName>/documentation/<targetname>`

## Release Process
- Use semantic versioning (v1.0.0).
- Tag releases in git.
- Tests must pass before tagging.
