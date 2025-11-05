# Maintenance Guide

Guidelines for maintaining and evolving the centralized AI tools system.

## Adding or Updating Standards

### Process

1. **Identify the need**: Note patterns used across multiple projects
2. **Draft the standard**: Create or update file in `docs/standards/`
3. **Test with one project**: Apply to a single project first
4. **Gather feedback**: Use journal to track effectiveness
5. **Roll out**: Update other projects as needed
6. **Document**: Note changes in centralized docs

### Best Practices

- **Keep backward compatible** where possible
- **Version breaking changes** (see Versioning section)
- **Note template impacts**: Document if templates need updates
- **Provide examples**: Include code samples and use cases
- **Link to resources**: Reference official documentation

### Example Workflow

```bash
# 1. Create new standard
edit docs/standards/testing.md

# 2. Update templates if needed
edit templates/warp.md.template

# 3. Test with one project
~/ai-tools/scripts/setup-project.sh ~/test-project test

# 4. (Optional) Add personal journal entry if relevant

# 5. Commit
git add docs/standards/testing.md
git commit -m "Add testing standards documentation"
```

## Adding Patterns

Patterns are reusable AI workflows and prompt templates.

### When to Add a Pattern

- You've used a prompt successfully across 2+ projects
- A workflow saves significant time
- A technique produces consistent good results

### Pattern Structure

```markdown
# Pattern Name

## Problem
What problem does this solve?

## Solution
How to apply this pattern

## Example
Concrete example with code/prompts

## When to Use
Applicable scenarios

## When Not to Use
Known limitations

## Related
Links to standards or other patterns
```

### Example Pattern File

`docs/patterns/refactoring-prompt.md`:
```markdown
# Refactoring with AI Assistance

## Problem
Need to refactor legacy code while maintaining behavior

## Solution
Use this prompt template:

"Refactor the following code according to [standard link].
Maintain all existing behavior. Add type hints and docstrings.
Preserve all tests."

## Example
[concrete example]

## When to Use
- Legacy code needs modernization
- Code review suggests improvements
- Preparing code for new features

## When Not to Use
- Critical production code without tests
- Code you don't understand
```

## Template Evolution

### Adding New Placeholders

Only add placeholders when:
- Needed by multiple projects (not just one)
- Reduces manual editing significantly
- Clear semantic meaning

### Process

1. Add placeholder to templates
2. Update `setup-project.sh` to handle it
3. Update README and USAGE docs
4. Provide migration notes
5. Test with a new project setup

### Example

```bash
# 1. Edit template
edit templates/warp.md.template
# Add: __PYTHON_VERSION__

# 2. Update script
edit scripts/setup-project.sh
# Add detection or parameter

# 3. Document
edit README.md
edit docs/USAGE.md

# 4. Note migration
edit docs/MAINTENANCE.md
# "Migration: Projects using old templates can add __PYTHON_VERSION__ manually"
```

## Versioning and Breaking Changes

### When Breaking Changes Occur

- Template structure changes significantly
- Placeholder names change
- Required files change

### Version Format

Use date-based versions in docs: `v2025-11` for November 2025

### Breaking Change Process

1. **Document in CHANGELOG**: Create `docs/CHANGELOG.md` if needed
2. **Migration guide**: Provide step-by-step instructions
3. **Deprecated notice**: Add notice to old docs
4. **Grace period**: Support old and new for overlap period

### Example CHANGELOG Entry

```markdown
## v2025-12 (Breaking)

### Changed
- Renamed `__PROJECT_DOMAIN__` to `__DOMAIN__`
- Split `.cursorrules` into separate standards file

### Migration
1. Update project configs: `s/__PROJECT_DOMAIN__/__DOMAIN__/g`
2. Move cursor-specific rules to new `.cursor-standards` file

### Deprecated
- Old `__PROJECT_DOMAIN__` placeholder (remove by 2026-01)
```

## Journal Housekeeping

### Annual Maintenance

**Each January:**

1. Create new year directory:
   ```bash
   mkdir -p journal/2026
   ```

2. Review previous year's entries for patterns

3. Extract reusable insights to standards/patterns:
   ```bash
   # Example: Found good pattern in journal
   grep "DeepSeek" journal/2025/*.md > /tmp/deepseek-notes.txt
   # Extract pattern to docs/patterns/deepseek-usage.md
   ```

### Quarterly Review

Every 3 months:
- Review journal for common themes
- Identify improvements to standards
- Note tool performance trends
- Update guides based on learnings

### Archive Strategy

- **Keep all entries**: Journal serves as historical reference
- **No deletion**: Disk space is cheap, context is valuable
- **Searchable**: Use grep/ripgrep for finding past observations

## Review Workflow

### For Standards/Patterns Updates

1. **Self-review**: Test with real project first
2. **Documentation check**: Ensure examples are clear
3. **Impact assessment**: Which projects affected?
4. **Commit with details**: Explain reasoning in commit message

### Recommended Commit Messages

```
Add error handling pattern

Based on successful use across multiple projects.
Includes retry logic and logging standards.

See journal/2025/11-03.md for context.
```

### Pull Request Process

If working in a team:

1. Create branch: `feature/add-testing-pattern`
2. Add/update docs
3. Test with one project
4. PR with:
   - Problem being solved
   - Example usage
   - Impact on existing projects
5. Review and merge

## Monitoring Effectiveness

### Track These Metrics

Use journal to note:
- **Time saved**: "Refactoring pattern saved 2 hours"
- **Consistency**: "All projects now use same testing approach"
- **Issues**: "Pattern X doesn't work well for Y domain"
- **Tool performance**: "Model A faster than B for task C"

### Quarterly Health Check

Review:
- Are projects using centralized docs?
- Are project-specific rules well-documented?
- Do templates need updates?
- Are journal insights being captured in patterns?

## Common Maintenance Tasks

### Update All Project Configs

```bash
# Script to update all projects (example)
for proj in ~/projects/*/; do
  if [ -f "$proj/warp.md" ]; then
    echo "Checking $proj"
    # Update specific rule/reference
  fi
done
```

### Find Projects Missing Configs

```bash
for proj in ~/projects/*/; do
  if [ ! -f "$proj/warp.md" ]; then
    echo "Missing warp.md: $proj"
  fi
done
```

### Sync Template Changes to Existing Projects

```bash
# Example: Add new section to all warp.md files
for proj in ~/projects/*/; do
  if [ -f "$proj/warp.md" ]; then
    echo "\n## Testing\nSee docs/standards/testing.md" >> "$proj/warp.md"
  fi
done
```

## Tips

- **Small, frequent updates** better than large overhauls
- **Test changes** with one project before rolling out
- **Document reasoning** in commits and journal
- **Keep it simple**: Resist over-engineering
- **Listen to pain points**: Journal reveals what needs fixing
- **Version control everything**: Easy rollback if needed
