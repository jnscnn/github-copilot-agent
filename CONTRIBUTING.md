# Contributing to github-copilot-agent

Thank you for your interest in contributing to this GitHub Copilot customization blueprint! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Contribution Guidelines](#contribution-guidelines)
- [Style Guidelines](#style-guidelines)
- [Testing Your Changes](#testing-your-changes)
- [Submitting Changes](#submitting-changes)

## Code of Conduct

This project adheres to the Contributor Covenant [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** (screenshots, code snippets, etc.)
- **Describe the behavior you observed and what you expected**
- **Include your environment details**:
  - VS Code version
  - GitHub Copilot extension version
  - Operating system

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Explain why this enhancement would be useful**
- **Include examples** of how the feature would be used

### Contributing New Customizations

You can contribute:

- **New Agent Skills** - Domain-specific capabilities in `.github/skills/`
- **Prompt Templates** - Reusable prompts in `.github/prompts/`
- **Custom Agents** - Specialized agent profiles in `.github/agents/`
- **Instructions Files** - Scoped instructions for specific contexts

## Development Setup

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR-USERNAME/github-copilot-agent.git
cd github-copilot-agent
```

1. **Open in VS Code**

```bash
code .
```

1. **Ensure you have the required extensions**:
   - GitHub Copilot
   - GitHub Copilot Chat

2. **Set up git hooks** (enforces Conventional Commits locally):

```bash
./scripts/setup-hooks.sh
```

## Contribution Guidelines

### Agent Skills

When creating a new skill in `.github/skills/<name>/SKILL.md`:

- Follow the existing `SKILL.md` structure
- Include clear `name`, `description`, and `usage` sections
- Provide concrete examples
- Document any dependencies or prerequisites
- Test thoroughly with the Copilot Customization Builder agent

### Prompt Templates

When creating prompt files in `.github/prompts/`:

- Use descriptive filenames: `<action>-<target>.prompt.md`
- Include YAML frontmatter with:
  - `name`: Display name (e.g., "Create New Skill")
  - `description`: Clear purpose statement
  - `input`: Required user inputs with descriptive prompts
- Write clear, actionable instructions
- Test with various input scenarios

### Custom Agents

When creating agents in `.github/agents/`:

- Define a clear, focused purpose
- Specify minimal necessary tools (security principle)
- Include comprehensive instructions
- Document limitations and use cases
- Test agent behavior thoroughly

### Instructions Files

When creating instruction files:

- Use descriptive filenames
- Include proper YAML frontmatter with `applyTo` glob patterns
- Keep instructions concise and actionable
- Test with relevant file types

## Style Guidelines

### Markdown

- Use ATX-style headings (`#` not underlines)
- Use fenced code blocks with language identifiers
- Keep lines under 120 characters when possible
- Use relative links for internal documentation

### YAML Frontmatter

```yaml
---
name: Display Name
description: Clear, concise description
applyTo: '**/*.{js,ts}'  # For instructions files
input:
  - slug: 'Enter a kebab-case identifier'
---
```

### File Organization

```
.github/
├── agents/              # Custom agent profiles
│   └── *.agent.md
├── prompts/            # Prompt templates
│   └── *.prompt.md
└── skills/             # Agent Skills
    └── <name>/
        ├── SKILL.md    # Required
        └── examples/   # Optional
```

## Testing Your Changes

1. **Local Testing**
   - Open the repository in VS Code
   - Test with the Copilot Chat interface
   - Verify agent/prompt/skill behavior
   - Check for errors or unexpected behavior

2. **Cross-platform Testing**
   - Test on Windows, macOS, and Linux if possible
   - Verify path handling works correctly

3. **Documentation Testing**
   - Ensure all links work
   - Verify code examples are correct
   - Check formatting renders properly

## Submitting Changes

### Pull Request Process

1. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
```

1. **Make your changes**
   - Follow the style guidelines
   - Test thoroughly
   - Update documentation as needed

2. **Commit your changes**

```bash
git add .
git commit -m "feat: add new skill for X"
```

> **Important:** This repository enforces [Conventional Commits](https://www.conventionalcommits.org/).
> A local git hook and CI check will reject non-conforming commit messages.

Use conventional commit messages:

- `feat:` - New features (triggers **minor** version bump)
- `fix:` - Bug fixes (triggers **patch** version bump)
- `feat!:` or `BREAKING CHANGE:` - Breaking changes (triggers **major** version bump)
- `docs:` - Documentation changes
- `style:` - Formatting, no code change
- `refactor:` - Code restructuring
- `perf:` - Performance improvements
- `test:` - Test additions/changes
- `build:` - Build system changes
- `ci:` - CI configuration changes
- `chore:` - Maintenance tasks
- `revert:` - Reverting a previous commit

Optional scope in parentheses: `feat(agents): add new debugging agent`

1. **Push to your fork**

```bash
git push origin feature/your-feature-name
```

1. **Open a Pull Request**
   - Use a clear, descriptive title
   - Reference any related issues
   - Describe what changed and why
   - Include testing steps

### PR Review Process

- Maintainers will review your PR
- Address any feedback or requested changes
- Once approved, your PR will be merged
- Your contribution will be included in the next release

## Questions?

If you have questions not covered here:

- Check existing [Issues](https://github.com/trsdn/github-copilot-agent/issues)
- Open a [Discussion](https://github.com/trsdn/github-copilot-agent/discussions)
- Reach out to maintainers

Thank you for contributing! 🎉
