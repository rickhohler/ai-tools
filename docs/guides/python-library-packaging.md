# Python Library Packaging and Publishing

Guide for setting up Python libraries for PyPI distribution with GitHub Actions automation.

## Project Structure

```
my-library/
├── src/
│   └── my_library/
│       ├── __init__.py
│       └── core.py
├── tests/
│   └── test_core.py
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── pyproject.toml
├── README.md
├── CHANGELOG.md
├── LICENSE
└── RELEASE.md
```

## pyproject.toml Configuration

Based on modern Python packaging standards (PEP 621):

```toml
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "my-library"
version = "0.1.0"
description = "Brief description of your library"
authors = [
    {name = "Your Name", email = "you@example.com"}
]
readme = "README.md"
requires-python = ">=3.8"
license = {text = "MIT"}
keywords = [
    "keyword1",
    "keyword2",
]
classifiers = [
    "Development Status :: 3 - Alpha",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.8",
    "Programming Language :: Python :: 3.9",
    "Programming Language :: Python :: 3.10",
    "Programming Language :: Python :: 3.11",
    "Programming Language :: Python :: 3.12",
]
dependencies = [
    "required-package>=1.0.0",
]

[project.urls]
Homepage = "https://github.com/username/my-library"
Repository = "https://github.com/username/my-library"
Issues = "https://github.com/username/my-library/issues"
Changelog = "https://github.com/username/my-library/blob/main/CHANGELOG.md"

[project.optional-dependencies]
dev = [
    "pytest>=7.0",
    "pytest-cov>=4.0",
    "black>=23.0",
    "ruff>=0.1",
    "mypy>=1.0",
]

[tool.setuptools.packages.find]
where = ["src"]

[tool.black]
line-length = 100
target-version = ['py38', 'py39', 'py310', 'py311', 'py312']

[tool.ruff]
line-length = 100
target-version = "py38"
```

## GitHub Actions CI/CD Workflow

Create `.github/workflows/ci-cd.yml`:

```yaml
name: CI/CD

on:
  push:
    branches: [ main, develop ]
    tags:
      - 'v*'
  pull_request:
    branches: [ main, develop ]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ['3.11', '3.12', '3.13']

    steps:
    - uses: actions/checkout@v4
    
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}
        cache: 'pip'
    
    - name: Install package in development mode
      run: |
        python -m pip install --upgrade pip
        pip install pytest pytest-cov
        pip install -e .[dev]
    
    - name: Lint with ruff
      run: |
        pip install ruff
        ruff check src/
      continue-on-error: true
    
    - name: Run pytest
      run: |
        pytest tests/ -v --cov=src --cov-report=term-missing --cov-report=xml
    
    - name: Test module imports
      run: |
        python -c "import my_library; print(f'✓ Version: {my_library.__version__}')"
    
    - name: Type checking with mypy
      run: |
        pip install mypy
        mypy src/ --ignore-missing-imports
      continue-on-error: true
    
    - name: Upload coverage
      if: matrix.python-version == '3.13'
      uses: codecov/codecov-action@v4
      continue-on-error: true
      with:
        token: ${{ secrets.CODECOV_TOKEN }}
        files: ./coverage.xml

  build:
    runs-on: ubuntu-latest
    needs: test
    steps:
    - uses: actions/checkout@v4
    
    - name: Set up Python
      uses: actions/setup-python@v5
      with:
        python-version: '3.11'
    
    - name: Install build dependencies
      run: |
        python -m pip install --upgrade pip
        pip install build twine
    
    - name: Build package
      run: |
        python -m build
        echo "✓ Package built successfully"
    
    - name: Check distribution
      run: |
        twine check dist/*
        echo "✓ Distribution files are valid"
    
    - name: Test installation
      run: |
        pip install dist/*.whl
        python -c "import my_library; print(f'✓ Installed: {my_library.__version__}')"
    
    - name: Upload build artifacts
      uses: actions/upload-artifact@v4
      with:
        name: dist
        path: dist/

  publish-testpypi:
    name: Publish to TestPyPI
    runs-on: ubuntu-latest
    needs: build
    if: github.event_name == 'push' && startsWith(github.ref, 'refs/tags/v')
    continue-on-error: true
    environment:
      name: testpypi
      url: https://test.pypi.org/p/my-library
    permissions:
      id-token: write
    
    steps:
    - name: Download build artifacts
      uses: actions/download-artifact@v4
      with:
        name: dist
        path: dist/
    
    - name: Publish to TestPyPI
      uses: pypa/gh-action-pypi-publish@release/v1
      with:
        repository-url: https://test.pypi.org/legacy/

  publish-pypi:
    name: Publish to PyPI
    runs-on: ubuntu-latest
    needs: [build, publish-testpypi]
    if: github.event_name == 'push' && startsWith(github.ref, 'refs/tags/v')
    environment:
      name: pypi
      url: https://pypi.org/p/my-library
    permissions:
      id-token: write
    
    steps:
    - name: Download build artifacts
      uses: actions/download-artifact@v4
      with:
        name: dist
        path: dist/
    
    - name: Publish to PyPI
      uses: pypa/gh-action-pypi-publish@release/v1
```

## PyPI Trusted Publishing Setup

### 1. Create GitHub Environments

In your GitHub repository:
1. Go to **Settings** → **Environments**
2. Create two environments:
   - `testpypi` - for Test PyPI (optional but recommended)
   - `pypi` - for production PyPI
3. (Optional) Add required reviewers for `pypi` environment

### 2. Configure PyPI Trusted Publishers

**For PyPI (production):**
1. Go to [PyPI Account Settings → Publishing](https://pypi.org/manage/account/publishing/)
2. Add a new "pending publisher":
   - **PyPI Project Name**: `my-library`
   - **Owner**: `your-github-username`
   - **Repository**: `my-library`
   - **Workflow**: `ci-cd.yml`
   - **Environment**: `pypi`

**For TestPyPI (optional):**
1. Go to [TestPyPI Account Settings → Publishing](https://test.pypi.org/manage/account/publishing/)
2. Configure same as above with environment `testpypi`

## Release Process

### 1. Update Version

```bash
# Edit version in pyproject.toml
vim pyproject.toml  # Change version = "0.2.0"

# Update CHANGELOG.md
vim CHANGELOG.md
```

### 2. Commit and Tag

```bash
# Commit changes
git add pyproject.toml CHANGELOG.md
git commit -m "chore: bump version to v0.2.0"

# Create and push tag
git tag v0.2.0
git push origin main
git push origin v0.2.0
```

### 3. Automated Publishing

GitHub Actions will automatically:
1. Run all tests across Python versions
2. Build wheel and source distribution
3. Validate with `twine check`
4. Publish to TestPyPI (if configured)
5. Publish to PyPI

### 4. Verify Release

```bash
# Install from PyPI
pip install --upgrade my-library

# Verify version
python -c "import my_library; print(my_library.__version__)"
```

## Version Numbering

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.0.0): Breaking changes
- **MINOR** (0.2.0): New features, backwards compatible
- **PATCH** (0.2.1): Bug fixes, backwards compatible

## Manual Release (Fallback)

If automated release fails:

```bash
# Install tools
pip install build twine

# Build
python -m build

# Check
twine check dist/*

# Upload to TestPyPI (optional)
twine upload --repository testpypi dist/*

# Upload to PyPI
twine upload dist/*
```

## Best Practices

### README.md

Include:
- Installation instructions
- Quick start example
- API documentation link
- Badge for PyPI version: `![PyPI](https://img.shields.io/pypi/v/my-library)`
- Badge for tests: Use GitHub Actions badge

### CHANGELOG.md

Format:
```markdown
# Changelog

## [Unreleased]
### Added
- New feature X

## [0.2.0] - 2025-01-15
### Added
- Feature Y
### Fixed
- Bug Z
```

### __init__.py

Export version:
```python
__version__ = "0.2.0"
__all__ = ["main_class", "main_function"]
```

### LICENSE

Include a license file (MIT is common for open source).

## Troubleshooting

### Workflow doesn't trigger
- Ensure tag starts with 'v': `v0.2.0`
- Push tag: `git push origin v0.2.0`

### Publishing fails
- Verify environment names match workflow
- Check PyPI trusted publisher configuration
- Ensure `id-token: write` permission

### Version already exists
- PyPI doesn't allow re-uploading same version
- Increment version and create new tag
- Delete failed tag: `git tag -d v0.2.0 && git push --delete origin v0.2.0`

## Resources

- [Python Packaging User Guide](https://packaging.python.org/)
- [PyPI Trusted Publishers](https://docs.pypi.org/trusted-publishers/)
- [GitHub Actions for Python](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python)
- [Semantic Versioning](https://semver.org/)
