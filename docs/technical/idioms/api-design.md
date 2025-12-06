# API Design Standards

## Separate External API from Internal Implementation

**CRITICAL**: Always apply design patterns to separate external API interfaces from internal implementation.

**Why**: Internal code may change over time with better implementations that are faster, more efficient, or use different algorithms. The external API must remain stable while internal implementation evolves.

### Required Patterns

1.  **Facade Pattern**
    - Define stable public protocol/contract for external API
    - Implement facade that delegates to internal implementation
    - Keep internal implementation `internal` (not `public`)
    - Clients use facade, never direct internal types

2.  **Protocol-Oriented Design**
    - Use protocols to define stable API contracts
    - Implementations conform to protocols
    - Internal implementations can change without affecting contracts

3.  **Access Control**
    - Public APIs: `public` protocols and facades
    - Internal implementations: `internal` (not `public`)
    - Private helpers: `private`

### Example (Swift)

```swift
// ✅ Good: Stable public contract
public protocol ArchiveContract {
    func createArchive(from: URL, to: URL) throws -> ArchiveMetadata
}

public struct ArchiveFacade: ArchiveContract {
    private let implementation: InternalArchiveManager  // Internal
    
    public func createArchive(from: URL, to: URL) throws -> ArchiveMetadata {
        // Delegate to internal implementation
        return try implementation.createArchive(from: from, to: to)
    }
}

// Internal implementation can change freely
internal struct InternalArchiveManager {
    func createArchive(from: URL, to: URL) throws -> ArchiveMetadata {
        // Implementation details...
    }
}
```

## Critical API Design Principles

1.  **Clarity at the point of use**: Code should read naturally at the call site.
2.  **Prefer methods/properties over free functions**: Use static methods for factory methods.
3.  **Naming Conventions**: Use standard conventions for the language (e.g., lowerCamelCase for Swift methods).
4.  **API Surface Design**: Make APIs easy to use correctly and hard to use incorrectly.
