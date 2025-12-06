# Using FileSystemKit

**FileSystemKit** is the standard abstraction layer for file system operations.

## Policy

1.  **Abstraction**: Do not use `FileManager.default` (Swift) or `os`/`shutil` (Python) directly in business logic. Use `FileSystemKit` interfaces.
2.  **Testability**: `FileSystemKit` provides in-memory implementations (`InMemoryFileSystem`), enabling fast, deterministic unit tests without disk I/O.
3.  **Consistency**: Ensures consistent error handling and path manipulation across projects.

## Workflow

1.  **Dependency Injection**: Inject `FileSystem` protocol/interface into your classes.
    ```swift
    class DataRepository {
        let fs: FileSystem
        
        init(fs: FileSystem = DiskFileSystem()) {
            self.fs = fs
        }
    }
    ```

2.  **Testing**:
    ```swift
    func testSave() {
        let mockFS = InMemoryFileSystem()
        let repo = DataRepository(fs: mockFS)
        // Test logic...
    }
    ```
