# Using FeatureFlagKit

**FeatureFlagKit** is the standard library for managing feature toggles and configuration flags in our ecosystem.

## Policy

1.  **Mandatory Usage**: All feature flags and remote configuration must use `FeatureFlagKit`. Do not prefer raw JSON parsing or environment variables for dynamic feature control.
2.  **Centralized Definition**: Define flags in a central `Features` enum (or similar structure) within your project to avoid magic strings.
3.  **Providers**: Configure appropriate providers (e.g., Local, Remote, Environment) at app startup.

## Workflow

1.  **Define Flag**:
    ```swift
    enum Features: String, FeatureFlagKey {
        case newUI = "new_ui_enabled"
        case analytics = "analytics_enabled"
    }
    ```

2.  **Check Flag**:
    ```swift
    if FeatureFlagKit.shared.isEnabled(Features.newUI) {
        showNewUI()
    } else {
        showOldUI()
    }
    ```

3.  **Test**: Use `MockProvider` in unit tests to deterministically control flag states.
