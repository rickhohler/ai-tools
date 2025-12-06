# Commit Workflow Standards

## Branch Strategy

- **Main Branch Protection**: Direct pushes to `main` are blocked.
- **Working Branches**: Always create a branch for every unit of work (`feat/`, `fix/`, `docs/`).

## Workflow Steps

1.  **Create Branch**:
    ```bash
    git checkout -b feat/my-feature
    ```

2.  **Update Changelog**:
    - Always update `CHANGELOG.md` under the `[Unreleased]` section before committing.

3.  **Conventional Commits**:
    Use the standard format: `<type>(<scope>): <subject>`
    - `feat`: New features
    - `fix`: Bug fixes
    - `docs`: Documentation
    - `refactor`: Code change that neither fixes a bug nor adds a feature
    - `test`: Adding missing tests or correcting existing tests
    - `chore`: Maintenance

    **Example**:
    ```
    feat(auth): add login validation logic
    
    Implements standard email validation.
    
    Closes #123
    ```

4.  **Pull Request**:
    - Push branch and create PR via GitHub CLI or Web UI.
    - Reference issues in the description.

## Authentication with GitHub CLI

When using `gh` commands, ensure you are authenticated as the correct user for the repository context.
