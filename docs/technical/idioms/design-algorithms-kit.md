# Using DesignAlgorithmsKit

**DesignAlgorithmsKit** is the canonical source for all code design patterns and algorithms in our ecosystem.

## Policy

1.  **Centralization**: Do not implement ad-hoc patterns (e.g., Singleton, Factory, Observer) or common algorithms (sorting, searching) within individual feature projects.
2.  **Reuse**: Import `DesignAlgorithmsKit` and use the standardized implementations.
3.  **Contribution**: If a pattern or algorithm is missing, add it to `DesignAlgorithmsKit` first, then consume it in your project.

## Workflow

### Adding a New Pattern

1.  Open `DesignAlgorithmsKit`.
2.  Implement the pattern/algorithm with tests.
3.  Release/merge.
4.  Update your project's dependency on `DesignAlgorithmsKit`.
5.  Import and use.

```swift
import DesignAlgorithmsKit

// Use standardized factory
let factory = AbstractFactory.make(...)
```
