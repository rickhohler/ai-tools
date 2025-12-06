# Issue Tracking Standards

All project management and issue tracking is conducted via **GitHub Project Issues**.

## Standard

1.  **System**: Use GitHub Issues exclusively. Do not use external tools (Jira, Trello) unless explicitly authorized.
2.  **Projects**: Issues should be added to the project board defined for the specific repository or organization.

## Labels

Apply standard labels to classify issues effectively.

### Type
- **`bug`**: Something isn't working
- **`enhancement`**: New feature or request
- **`documentation`**: Improvements or additions to documentation
- **`refactor`**: Code change that neither fixes a bug nor adds a feature (Tech Debt)
- **`test`**: Adding missing tests or correcting existing tests

### Priority
- **`priority: critical`**: Must fix immediately (blocks release/production)
- **`priority: high`**: Important for next release
- **`priority: medium`**: Normal priority
- **`priority: low`**: Nice to have

### Status
- **`wontfix`**: This will not be worked on
- **`duplicate`**: This issue already exists
- **`good first issue`**: Good for newcomers

## Milestones

Use milestones to group issues into releases.

- **`vX.Y.Z`** (e.g., `v1.0.0`): Issues targeting a specific semantic version release.
- **`Backlog`**: Valid issues that are not currently prioritized for a specific release.
