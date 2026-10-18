# cloudiful/tap

Homebrew tap for [phasegent](https://github.com/cloudiful/phasegent), a
role-aware CLI for phase-oriented provider-backed workflows, and
[git-ai-commit](https://github.com/cloudiful/git-ai-commit), an AI-generated Git
commit message tool.

## Install

```sh
brew tap cloudiful/tap
brew install cloudiful/tap/phasegent
brew install cloudiful/tap/git-ai-commit
```

## Upgrade

```sh
brew upgrade cloudiful/tap/phasegent
brew upgrade cloudiful/tap/git-ai-commit
```

## Platform support

- macOS ARM64 (Apple Silicon): supported.
- Linux x86_64 and Linux ARM64: supported.
- Intel Mac (`x86_64-apple-darwin`): **not supported yet** — no native Intel
  build is published, so `brew install` on an Intel Mac will fail. Use an
  ARM64 Mac or a supported Linux machine instead.

`git-ai-commit` is distributed as a binary formula for Apple Silicon macOS and
Linux ARM64/x86_64. `git-ai-commit` Intel Mac builds are not published.
