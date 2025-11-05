# Ollama Local Setup Guide

This guide covers installing and using Ollama locally, recommended models, and configuring the Continue extension in VS Code.

## Recommended Reading

Article: [Top Ten Best Ollama Models for Developers](https://collabnix.com/best-ollama-models-for-developers-complete-2025-guide-with-code-examples/#:~:text=CodeLlama%2034B%20%E2%80%93%20Best%20for%20Code%20Generation,-Model%3A%20codellama%3A34b&text=It%20excels%20at%20understanding%20context,and%20generating%20production%2Dready%20code.&text=Performance%20Metrics%3A,Code%20completion%20accuracy%3A%2087%25)

## Install Subset of Top 10

Pull these recommended models:

```bash
ollama pull deepseek-r1
ollama pull codellama:34b
ollama pull llama3.1:70b
ollama pull qwen2.5-coder:32b
```

Check what is installed:

```bash
ollama list
```

## Setup Continue in VS Code

Reference: [Using Ollama with Continue](https://docs.continue.dev/guides/ollama-guide)

### Installation

1. Install **Continue** plugin in VS Code
2. Open Command Palette → "Continue: Open Config"
3. Configure Ollama as your provider

### Configuration Examples

#### Local Config with Autodetect

```yaml
name: Local Config
version: 1.0.0
schema: v1
models:
  - name: Autodetect
    provider: ollama
    model: AUTODETECT
```

#### Local Config with Specific Models

```yaml
name: Local Config
version: 1.0.0
schema: v1
models:
  - name: DeepSeek R1 32B
    provider: ollama
    model: deepseek-r1:32b
    roles:
      - chat
      - edit
  - name: Qwen2.5-Coder 1.5B
    provider: ollama
    model: qwen2.5-coder:1.5b
    roles:
      - autocomplete
```

## Troubleshooting

- If VS Code/Continue can't connect, ensure Ollama is running:
  ```bash
  curl http://localhost:11434/api/tags
  ```
- If model pulls fail, check disk space and network; retry `ollama pull ...`
