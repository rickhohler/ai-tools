# OpenAI Codex

## Current Status

**Original Codex API**: Deprecated in March 2023  
**Current Codex**: Relaunched as a coding agent at [chatgpt.com/features/codex](https://chatgpt.com/features/codex)

Codex is now a coding agent accessible through ChatGPT, not an API or VS Code extension. It's powered by advanced models (GPT-4o, o1) and provides autonomous coding assistance.

## For Users of Original Codex API (2021-2023)

The original Codex API and models were shut down in March 2023. If you were using them:

### 1. Switch to GitHub Copilot

GitHub Copilot is built on OpenAI's models (including GPT-4) and provides:
- IDE integration (VS Code, JetBrains, Neovim, etc.)
- Better context awareness
- Project-specific customization
- Active development and support

**Setup**: See our [GitHub Copilot template](../../templates/.github-copilot.template)

### 2. Use OpenAI API with Modern Models

For programmatic access to current OpenAI models:

```python
from openai import OpenAI

client = OpenAI(api_key="your-api-key")

# Use GPT-4o or GPT-4 for coding tasks
response = client.chat.completions.create(
    model="gpt-4o",  # or "gpt-4", "gpt-3.5-turbo"
    messages=[
        {"role": "system", "content": "You are a helpful coding assistant. Follow standards at ~/ai-tools/docs/standards/"},
        {"role": "user", "content": "Write a Python function to..."}
    ]
)
```

### 3. Use Codex Coding Agent

**Access**: [chatgpt.com/features/codex](https://chatgpt.com/features/codex)

**Codex is a coding agent that:**
- Runs autonomously to solve coding problems
- Can read and edit files
- Executes code and tests
- Iterates on solutions
- Integrated directly in ChatGPT interface

**No project template needed** - Codex is used through the ChatGPT web interface, not as a local IDE integration.

### 4. Alternative AI Coding Tools

Other options to consider:
- **GitHub Copilot** - Primary recommendation (GitHub subscription)
- **Cursor** - AI-first IDE (uses various models)
- **Continue** - Open-source, supports multiple providers
- **Warp AI** - Terminal with AI assistance
- **Codeium** - Free alternative to Copilot

## Codex Evolution

### Original Codex (2021-2023)
- Released in 2021 as OpenAI's first dedicated code generation model
- Based on GPT-3 architecture, fine-tuned on code
- Foundation for initial GitHub Copilot
- API deprecated and shut down in March 2023
- Superseded by GPT-3.5-Turbo and GPT-4

### New Codex Suite (2024-2025)
- Relaunched as AI software engineering tools
- Powered by modern models: GPT-4o, GPT-5-Codex
- More advanced capabilities than original Codex
- Check OpenAI's website for latest features and access

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

## Resources

- [OpenAI Platform](https://platform.openai.com/) - Latest API documentation
- [OpenAI Models](https://platform.openai.com/docs/models) - Current model offerings
- [GitHub Copilot](https://github.com/features/copilot) - IDE integration

**Note**: For the latest information on the new Codex suite, check OpenAI's official announcements and documentation.
