# Testing Standards

## Principles

- **Comprehensive**: Write unit tests for all new functionality.
- **Coverage**: Aim for meaningful code coverage (Standard target: >80% for new code).
- **Isolation**: Use mock implementations for dependencies (e.g., FileSystem, Network) to ensure fast, deterministic tests.

## Naming Conventions

Use descriptive test names that describe the scenario and expected outcome:

```swift
func testFunctionName_WhenCondition_ShouldReturnExpectedResult() { ... }
```

**Examples**:
- `testSave_WhenDiskFull_ShouldThrowError()`
- `testLogin_WithValidCredentials_ShouldSucceed()`

## Best Practices

1.  **Test Both Paths**: Verify both success and error cases.
2.  **Mocking**: Create reusable mocks (e.g., `MockDatabase`) rather than partial mocks or real dependencies.
3.  **Performance**: Tests should run quickly; avoid `sleep()` or real network calls.

## Running Tests

Standard command for most projects:
```bash
# Swift
swift test --enable-code-coverage
```
