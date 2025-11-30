# Migration Guide: From 'q' to 'kiro-cli'

This document provides detailed migration guidance for updating from the old `q` command to the new `kiro-cli` command structure.

## Overview

The git-qcommit project has been updated to use the new `kiro-cli` command structure. This migration ensures compatibility with the latest AI-powered CLI tools and provides a more explicit, maintainable command interface.

## What Changed

### Command Structure

| Aspect | Old (`q` command) | New (`kiro-cli`) |
|--------|-------------------|------------------|
| **Base Command** | `q chat` | `kiro-cli chat` |
| **Auto-approve Flag** | `-a` | `--no-interactive --trust-all-tools` |
| **Input Method** | Piped stdin | Piped stdin (unchanged) |
| **Output** | Stdout | Stdout (unchanged) |

### Specific Changes in git-qcommit

#### 1. Command Invocation (Line 47)

**Before:**
```bash
echo -e "..." | q chat -a
```

**After:**
```bash
echo -e "..." | kiro-cli chat --no-interactive --trust-all-tools
```

#### 2. Documentation Comments

**Before:**
```bash
# git-qcommit: Git plugin to generate commit messages using Amazon Q
```

**After:**
```bash
# git-qcommit: Git plugin to generate commit messages using kiro-cli
```

## Why These Changes?

### 1. Explicit Flag Names
The new `--no-interactive` and `--trust-all-tools` flags are more explicit than the cryptic `-a` flag, making the code:
- More readable and self-documenting
- Easier to understand for new contributors
- More maintainable in the long term

### 2. Future-Proof
The `kiro-cli` command structure is the official, supported interface going forward. Migrating ensures:
- Long-term compatibility
- Access to new features
- Continued support and updates

### 3. Tool Separation
The `kiro-cli` naming makes it clear that this is a separate CLI tool, not tied to any specific cloud provider's branding.

## Migration Steps for Users

### Step 1: Install kiro-cli

Follow the official installation instructions for kiro-cli. The tool should be available in your PATH.

### Step 2: Verify Installation

```bash
kiro-cli --version
```

### Step 3: Update git-qcommit Script

Replace your existing git-qcommit script with the new version from this repository.

### Step 4: Test the Migration

Stage some changes and run:
```bash
git qcommit
```

If successful, you should see the same behavior as before.

## Backward Compatibility

### User Interface
The user-facing interface remains 100% unchanged:
- Same command: `git qcommit [prompt_name|prompt]`
- Same behavior: generates commit messages based on staged changes
- Same prompt styles: all existing prompts continue to work
- Same workflow: interactive confirmation before committing

### What's NOT Compatible
If you have:
- Custom scripts that directly call the old `q` command
- Automation that depends on the `q` binary

You'll need to update those separately to use `kiro-cli`.

## New kiro-cli Features (Optional)

While git-qcommit maintains its simple interface, kiro-cli offers additional features you might want to explore:

### Resume Previous Sessions
```bash
kiro-cli chat --resume
```

### Use Specific Agents
```bash
kiro-cli chat --agent <agent-name> "Your question"
```

### Direct Invocation (Without Pipe)
```bash
kiro-cli chat "Your question"
```

## Troubleshooting

### Issue: "kiro-cli: command not found"

**Solution:** Install kiro-cli and ensure it's in your PATH:
```bash
which kiro-cli
```

### Issue: Different behavior than before

**Solution:** Verify that `--no-interactive --trust-all-tools` produces the same behavior as `-a`:
```bash
# Test with a simple command
echo "Hello" | kiro-cli chat --no-interactive --trust-all-tools
```

### Issue: Authentication errors

**Solution:** Ensure kiro-cli is properly configured:
```bash
kiro-cli chat "test"
```

If this works interactively, the non-interactive mode should work too.

## Advanced: Flag Mapping Reference

If you're migrating other scripts or tools, here's the flag mapping:

| Old Flag | New Flag(s) | Purpose |
|----------|-------------|---------|
| `-a` | `--no-interactive --trust-all-tools` | Auto-approve/non-interactive mode |
| (none) | `--resume` | Resume previous session (new feature) |
| (none) | `--agent <name>` | Use specific agent (new feature) |

## Questions or Issues?

If you encounter any issues during migration:

1. Check that kiro-cli is properly installed: `kiro-cli --version`
2. Verify the script syntax: `bash -n git-qcommit`
3. Test with a simple staging and commit scenario
4. Review the kiro-cli documentation for additional options

## Future Considerations

The migration maintains backward compatibility in terms of user interface, but provides a foundation for future enhancements:

- Potential to add agent selection to git-qcommit
- Option to resume previous commit message generation sessions
- Integration with other kiro-cli features

These enhancements can be added without breaking existing functionality.
