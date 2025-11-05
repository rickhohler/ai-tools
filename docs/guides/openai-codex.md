# OpenAI Codex (Deprecated)

## Status: Deprecated

OpenAI Codex was officially deprecated in March 2023. The technology has been integrated into **GitHub Copilot**, which is the recommended successor.

## Migration Path

If you were using OpenAI Codex directly:

### 1. Switch to GitHub Copilot

GitHub Copilot is built on OpenAI's models (including GPT-4) and provides:
- IDE integration (VS Code, JetBrains, Neovim, etc.)
- Better context awareness
- Project-specific customization
- Active development and support

**Setup**: See our [GitHub Copilot template](../../templates/.github-copilot.template)

### 2. Use OpenAI API Directly

For programmatic access to OpenAI models:

```python
from openai import OpenAI

client = OpenAI(api_key="your-api-key")

response = client.chat.completions.create(
    model="gpt-4",
    messages=[
        {"role": "system", "content": "You are a helpful coding assistant."},
        {"role": "user", "content": "Write a Python function to..."}
    ]
)
```

### 3. Alternative Tools

Consider these alternatives:
- **GitHub Copilot** - Primary recommendation
- **Cursor** - AI-first IDE
- **Continue** - Open-source Copilot alternative
- **Warp AI** - Terminal with AI assistance
- **Codeium** - Free GitHub Copilot alternative

## Historical Context

Codex was:
- Released in 2021 as OpenAI's code generation model
- The foundation for initial GitHub Copilot
- Available via API until March 2023
- Superseded by GPT-3.5 Turbo and GPT-4

## For This Project

Use our centralized templates for modern alternatives:
- `.github-copilot` - GitHub Copilot configuration
- `.cursorrules` - Cursor IDE configuration
- `.continue-config` - Continue extension configuration
- `warp.md` - Warp Terminal AI configuration

Run setup script:
```bash
~/ai-tools/scripts/setup-project.sh /path/to/project domain
```
