# Semantic Versioning Policy

All projects in this ecosystem must adhere to [Semantic Versioning 2.0.0](https://semver.org/) (SemVer).

## Version Format
Versions must follow the format `MAJOR.MINOR.PATCH` (e.g., `1.2.3`).

-   **MAJOR**: Incompatible API changes.
-   **MINOR**: Backwards-compatible functionality additions.
-   **PATCH**: Backwards-compatible bug fixes.

## Rules

### 1. Public API
Every project must explicitly define its "Public API".
-   For Swift Packages: Public classes, structs, enums, protocols, and functions.
-   For Tools: Command-line arguments, configuration file formats, and output formats.

### 2. Incrementing Versions
-   **PATCH (`x.y.Z`)**: Must contain *only* backwards-compatible bug fixes.
-   **MINOR (`x.Y.z`)**: Must contain backwards-compatible new features. May include patch-level changes.
-   **MAJOR (`X.y.z`)**: Must be incremented if *any* backwards-incompatible change is introduced to the public API.

### 3. Initial Development (`0.x.y`)
-   Anything MAY change at any time.
-   The public API SHOULD NOT be considered stable.
-   Projects should aim to reach `1.0.0` quickly to establish stability.

### 4. Tagging
-   Git tags MUST be used for releases.
-   Tags MUST include a `v` prefix: `v1.2.3`.
-   Git tags MUST exactly match the version number in the package manifest (e.g., `Package.swift`).

## Best Practices
-   **Avoid "Release Trains"**: Release as soon as a feature or fix is ready.
-   **Automate Releases**: Use CI/CD to automate the creation of releases and git tags.
-   **Changelogs**: Always update `CHANGELOG.md` before releasing a new version.
