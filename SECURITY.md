# Security Policy

## Supported Versions

We release updates and security patches for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| < Latest| :x:                |

We recommend always using the latest release to ensure you have the most recent security updates and features.

## Reporting a Vulnerability

We take the security of github-copilot-agent seriously. If you discover a security vulnerability, please follow these steps:

### How to Report

**Please do NOT report security vulnerabilities through public GitHub issues.**

Instead, please report them via one of the following methods:

1. **Preferred**: Use GitHub's Security Advisory feature
   - Go to the [Security tab](https://github.com/trsdn/github-copilot-agent/security)
   - Click "Report a vulnerability"
   - Fill out the form with details

2. **Alternative**: Email the maintainers directly
   - Contact: [Create a private security advisory]

### What to Include

When reporting a vulnerability, please include:

- **Description** of the vulnerability
- **Steps to reproduce** the issue
- **Potential impact** of the vulnerability
- **Suggested fix** (if you have one)
- **Your contact information** for follow-up questions

### What to Expect

After you submit a vulnerability report:

1. **Acknowledgment**: We'll acknowledge receipt within **48 hours**
2. **Assessment**: We'll assess the vulnerability and determine its severity
3. **Updates**: We'll keep you informed of our progress
4. **Resolution**: We'll work on a fix and release it as soon as possible
5. **Credit**: With your permission, we'll credit you in the release notes

### Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity
  - Critical: Within 7 days
  - High: Within 14 days
  - Medium: Within 30 days
  - Low: Next scheduled release

## Security Best Practices

When using this repository:

### For Repository Maintainers

1. **Review customizations carefully** before merging PRs
2. **Limit tool access** in agent definitions (use explicit `tools: []`)
3. **Validate input** from prompt template variables
4. **Never commit secrets** or credentials
5. **Review GitHub Actions workflows** for security issues

### For Users

1. **Review generated code** before executing it
2. **Don't trust untrusted sources** when copying customizations
3. **Keep VS Code and extensions updated**
4. **Use workspace trust** features in VS Code
5. **Review permissions** for custom agents and prompts

## Known Security Considerations

### Agent Tool Access

Custom agents can request access to various VS Code APIs and tools. Always review the `tools:` list in `.agent.md` files to understand what capabilities an agent has.

### Prompt Template Execution

Prompt templates can execute code generation. Always review generated code before:
- Committing it to your repository
- Running terminal commands
- Deploying to production

### Third-Party Integrations

If you integrate this blueprint with third-party tools or services:
- Review their security policies
- Understand data sharing implications
- Keep credentials secure

## Disclosure Policy

When we receive a security report:

1. We'll work with the reporter to understand and verify the issue
2. We'll develop a fix in a private repository if needed
3. We'll release the fix and publish a security advisory
4. We'll credit the reporter (with permission)

We ask that security researchers:

- Allow us reasonable time to fix the issue before public disclosure
- Make a good faith effort to avoid privacy violations and data destruction
- Don't exploit the vulnerability beyond demonstrating it exists

## Security Updates

Security updates are released as:

- **Patch releases** for critical vulnerabilities
- **Minor releases** for other security improvements

Subscribe to repository releases to stay informed:
- Watch the repository
- Enable notifications for releases
- Star the repo for visibility

## Resources

- [GitHub Security Advisories](https://github.com/trsdn/github-copilot-agent/security/advisories)
- [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md)
- [Contributing Guidelines](CONTRIBUTING.md)

## Questions?

If you have questions about this security policy:

- Open a [Discussion](https://github.com/trsdn/github-copilot-agent/discussions)
- Contact the maintainers

Thank you for helping keep github-copilot-agent secure! 🔒
