# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Swift Package Standards**: Comprehensive guide (`swift-package-guide.md`) and workflow templates (`tests.yml`, `docs.yml`).
- **Generic Standards**: New standards for API Design, Reusability, Testing, Security, and Code of Conduct.
- **Process Standards**: New guides for Commit Workflow and Issue Tracking.
- **Project Policies**: Explicit policies for `DesignAlgorithmsKit`, `FeatureFlagKit`, and `FileSystemKit`.
- **CI/CD**: Standardized workflow templates for generic use.

### Changed
- **Documentation Structure**: Completely restructured `docs/` into `technical/` (standards), `preferences/` (team prefs), and `guides/` (tutorials).
- **Index**: Updated `README.md` to serve as a navigable index for the new documentation structure.
- **Genericization**: Removed all specific references to `RetroboxShell` to make `ai-tools` a generic compliance kit.

### Removed
- **Journaling**: Removed the journaling feature (`journal/` directory and `scripts/journal.sh`) as it was out of scope for a tooling repo.
