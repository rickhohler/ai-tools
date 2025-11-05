# Swift and Apple Platform Standards

This document centralizes Swift coding standards for iOS, macOS, watchOS, and tvOS development.

## Tools

Maintain consistent code quality with these tools:

- **IDE**: Xcode
- **Formatter**: SwiftFormat or built-in Xcode formatting
- **Linter**: SwiftLint
- **Package manager**: Swift Package Manager (SPM) or CocoaPods

## Quick Setup

### SwiftLint

```yaml
# .swiftlint.yml
disabled_rules:
  - trailing_whitespace
opt_in_rules:
  - empty_count
  - empty_string
included:
  - Sources
excluded:
  - Carthage
  - Pods
  - DerivedData
line_length: 120
```

```bash
# Install SwiftLint
brew install swiftlint

# Run
swiftlint
swiftlint --fix
```

### SwiftFormat

```bash
# Install
brew install swiftformat

# Run
swiftformat .
```

## Common Commands

```bash
# Build
xcodebuild -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 15'

# Test
xcodebuild test -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 15'

# Clean
xcodebuild clean
rm -rf ~/Library/Developer/Xcode/DerivedData
```

## Code Style

- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use meaningful names: `fetchUserData()` not `getData()`
- Prefer `let` over `var`
- Use strong typing, avoid `Any` when possible

## Project Structure

```
MyApp/
├── Sources/
│   ├── Models/
│   ├── Views/
│   ├── ViewModels/
│   ├── Services/
│   ├── Utilities/
│   └── Resources/
├── Tests/
│   ├── UnitTests/
│   └── UITests/
└── Package.swift or .xcodeproj
```

## Architecture Patterns

Document your choice in project-specific rules:
- **SwiftUI + Observables** (modern approach)
- **MVVM** (Model-View-ViewModel)
- **MVC** (Model-View-Controller)
- **VIPER** (for complex apps)
- **TCA** (The Composable Architecture)

## SwiftUI Best Practices

```swift
// Use @State for local state
@State private var username = ""

// Use @Binding for passed state
struct ChildView: View {
    @Binding var isPresented: Bool
}

// Use @Observable for view models (iOS 17+)
@Observable
class ViewModel {
    var data: [Item] = []
}

// Prefer ViewBuilder for complex views
@ViewBuilder
func makeContent() -> some View {
    if condition {
        ContentA()
    } else {
        ContentB()
    }
}
```

## UIKit Best Practices

```swift
// Use strong references appropriately
weak var delegate: MyDelegate?

// Handle memory properly
deinit {
    NotificationCenter.default.removeObserver(self)
}

// Use auto layout programmatically or storyboards consistently
// Document choice in project rules
```

## Testing

- Unit tests with XCTest
- UI tests for critical flows
- Snapshot testing for visual regression
- Aim for >70% code coverage on business logic

```swift
import XCTest
@testable import MyApp

final class MyTests: XCTestCase {
    func testExample() {
        let result = myFunction()
        XCTAssertEqual(result, expectedValue)
    }
}
```

## Dependency Management

### Swift Package Manager (Preferred)

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0")
]
```

### CocoaPods

```ruby
# Podfile
platform :ios, '15.0'
use_frameworks!

target 'MyApp' do
  pod 'Alamofire', '~> 5.8'
end
```

## Platform-Specific

### iOS
- Support latest iOS and iOS-1
- Handle different screen sizes (iPhone SE to Pro Max)
- Support Dark Mode
- Follow Human Interface Guidelines

### macOS
- Support latest macOS and macOS-1
- Handle window management appropriately
- Support keyboard shortcuts
- Follow macOS Human Interface Guidelines

### watchOS
- Keep complications simple and fast
- Minimize battery usage
- Use appropriate complication families

## Concurrency

Use modern Swift concurrency:

```swift
// Async/await
func fetchData() async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// Actors for thread safety
actor DataCache {
    private var cache: [String: Data] = [:]
    
    func get(_ key: String) -> Data? {
        cache[key]
    }
}
```

## Best Practices

- Use optionals properly (`if let`, `guard let`)
- Avoid force unwrapping (`!`) unless absolutely certain
- Handle errors with `do-catch` or `try?`/`try!` appropriately
- Use extensions to organize code
- Document public APIs with doc comments (`///`)
- Keep view controllers/views focused (Single Responsibility)

## Security

- Use Keychain for sensitive data
- Enable App Transport Security (ATS)
- Validate certificates for network calls
- Don't hardcode API keys or secrets
- Use code signing and provisioning properly
