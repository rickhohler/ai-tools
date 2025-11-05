# AI Tools Journal

## Purpose

Capture your own daily, timestamped observations and personal learnings about AI tool usage across projects.

**Note**: This journal is for your personal thoughts and observations only. Automated/scripted entries should not be added.

## Structure

- **Format**: `journal/YYYY/MM-DD.md`
- **Organization**: One file per day, stored under the year directory
- **Current Year**: `journal/2025/`

## Entry Format

Use ISO-like timestamps and keep notes concise:

```markdown
# Journal for 2025-11-05

[2025-11-05 10:14] Tested Continue config referencing centralized docs.
[2025-11-05 15:32] Updated Cursor rules to include database connection pooling.
```

## Tips

- Keep entries concise and practical
- Reference commit hashes or PRs when relevant
- Note what worked well and what didn't
- Track model performance on specific tasks
- Document workarounds for tool limitations

## Helper Script

Use the journal helper for quick entries:

```bash
~/ai-tools/scripts/journal.sh Your observation here
```

This automatically creates the daily file (if needed) and appends a timestamped entry.

## Housekeeping

- Start a new year directory each January (e.g., `journal/2026/`)
- No need to delete old entries - they serve as a historical reference
