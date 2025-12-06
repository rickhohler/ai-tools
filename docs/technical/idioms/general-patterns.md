# General Technical Idioms

This document outlines objective technical patterns we strive to follow.

## Core Idioms
- **Fail Fast**: validate inputs early
- **Immutability**: prefer immutable data structures by default
- **Separation of Concerns**: keep UI separate from business logic

## Standard Libraries
- **Features**: Use [FeatureFlagKit](feature-flag-kit.md) for all toggles.
- **Files**: Use [FileSystemKit](file-system-kit.md) for all file I/O.

## Code Patterns & Algorithms
**CRITICAL**: All code design patterns (Singleton, Factory, etc.) and algorithms MUST use **DesignAlgorithmsKit**.
- Do not re-implement patterns locally.
- If a pattern is missing, add it to `DesignAlgorithmsKit`.
- See [DesignAlgorithmsKit Guide](design-algorithms-kit.md).
