# git-qcommit

A Git plugin that generates descriptive commit messages using kiro-cli AI assistance.

## Features

- Automatically generates commit messages based on your staged changes
- Supports multiple prompt styles (conventional, detailed, emoji, pirate, and more!)
- Interactive confirmation before committing
- Customizable prompt templates

## Prerequisites

- Git
- [kiro-cli](https://github.com/aws/kiro-cli) - The AI-powered CLI tool
- Bash shell

## Installation

1. Clone or download this repository
2. Make the script executable:
   ```bash
   chmod +x git-qcommit
   ```
3. Copy the script to a directory in your PATH:
   ```bash
   sudo cp git-qcommit /usr/local/bin/
   ```
4. Copy the commit prompts file to your home directory:
   ```bash
   cp commitprompts ~/.commitprompts
   ```

## Usage

### Basic Usage

Stage your changes and run:
```bash
git qcommit
```

This will use a random prompt style from your `~/.commitprompts` file to generate a commit message.

### Using a Specific Prompt Style

You can specify a prompt style by name:
```bash
git qcommit conventional
git qcommit emoji
git qcommit pirate
```

### Using a Custom Prompt

You can also provide a custom prompt directly:
```bash
git qcommit "Write a commit message that focuses on the business value"
```

## Available Prompt Styles

The default `~/.commitprompts` file includes these styles:
- **conventional**: Conventional commit format
- **detailed**: Detailed with bullet points
- **headline**: Newspaper headline style
- **why**: Explains the why, not just the what
- **angular**: Angular commit convention
- **solution**: Problem and solution
- **future**: Easy for future developers
- **emoji**: With representative emojis
- **fifty**: 50/72 rule compliance
- **ticket**: References issue numbers
- **breaking**: Separates breaking changes
- **debt**: Technical debt implications
- **performance**: Performance optimizations
- **security**: Security implications
- **ux**: UI/UX changes from user perspective
- **pirate**: Pirate speak (arrr!)
- **leet**: L33t Sp34k
- **rhyme**: Rhyming poem
- **riddle**: Riddle format
- **hero**: Superhero style
- **10x**: Overconfident 10X developer

## Customization

Edit `~/.commitprompts` to add your own prompt styles. The format is:
```
name,prompt description
```

For example:
```
haiku,Write a commit message in haiku format with 5-7-5 syllables
```

## Migration from Old 'q' Command

This project has been updated to use the new `kiro-cli` command structure instead of the deprecated `q` command.

### What Changed

- Command invocation: `q chat -a` → `kiro-cli chat --no-interactive --trust-all-tools`
- The `-a` flag has been replaced with explicit `--no-interactive` and `--trust-all-tools` flags
- Updated documentation to reflect kiro-cli usage

### Upgrade Steps

If you're upgrading from a version that used the `q` command:

1. Install kiro-cli following the [official installation instructions](https://github.com/aws/kiro-cli)
2. Update your git-qcommit script to the latest version (this version)
3. No configuration changes needed - the script works the same way from a user perspective

### Backward Compatibility

The user-facing interface remains unchanged. The migration is transparent to users - just ensure `kiro-cli` is installed and available in your PATH.

## How It Works

1. Checks for staged changes in your Git repository
2. Selects a prompt style (random, named, or custom)
3. Analyzes your staged changes using `kiro-cli chat`
4. Generates a commit message based on the prompt style
5. Shows you the message and asks for confirmation
6. Commits with the generated message if approved

## Technical Details

The script uses `kiro-cli chat` with the following flags:
- `--no-interactive`: Runs in non-interactive mode
- `--trust-all-tools`: Automatically trusts all tools without prompting

The input is piped to kiro-cli, which includes:
- Your staged changes (via Git context)
- Instructions to write the message to a temporary file
- The selected prompt style

## Troubleshooting

### "kiro-cli: command not found"

Make sure kiro-cli is installed and available in your PATH. Install it following the [official documentation](https://github.com/aws/kiro-cli).

### "No staged changes found"

Stage your changes first with:
```bash
git add <files>
```

### "Failed to generate commit message"

Ensure kiro-cli is properly configured and authenticated. Try running a simple command first:
```bash
kiro-cli chat "Hello"
```

## License

See LICENSE file for details.
