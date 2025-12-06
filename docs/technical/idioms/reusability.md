# Code Reusability Standards

**CRITICAL**: All types must be designed for reusability and testability.

## Principles

1.  **Break Down Types into Reusable Components**
    - Each type should have a single, well-defined responsibility.
    - Prefer composition over large monolithic types.
    - Extract shared functionality into reusable core types.

2.  **Always Look for Existing Types**
    - **BEFORE creating new types, search for existing reusable types.**
    - Check core/common modules for existing implementations.
    - Avoid duplicating functionality that already exists.

3.  **Testability Requirements**
    - All types must be easily testable in isolation.
    - Dependencies should be injectable (use protocols/interfaces, not concrete types).
    - Avoid tight coupling that prevents unit testing.

## Reusability Checklist

**Before creating a new type:**
- [ ] Have you searched for existing types that could be reused?
- [ ] Have you checked core/common modules for similar functionality?
- [ ] Can you extend an existing type instead of creating a new one?
- [ ] Is this type focused on a single responsibility?
- [ ] Can this type be easily tested in isolation?
- [ ] Are dependencies injectable?

**When updating code:**
- [ ] Can you use existing core types instead of duplicating?
- [ ] Are there opportunities to extract shared functionality?
- [ ] Can you refactor to use reusable components?
