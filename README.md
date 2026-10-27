# cloudiful/tap

Homebrew tap for [phasegent](https://github.com/cloudiful/phasegent), a
role-aware CLI for phase-oriented provider-backed workflows,
[git-ai-commit](https://github.com/cloudiful/git-ai-commit), an AI-generated Git
commit message tool, [prompt-ferry](https://github.com/cloudiful/prompt-ferry),
an OpenAI-compatible relay and worker for upstream ferrying, and the independent
cloudiful fork of [Forgejo CLI](https://github.com/cloudiful/forgejo-cli).

## Install

```sh
brew tap cloudiful/tap
brew install cloudiful/tap/phasegent
brew install cloudiful/tap/git-ai-commit
brew install cloudiful/tap/prompt-ferry
brew install cloudiful/tap/fj
```

Verify the `fj` install with `brew test cloudiful/tap/fj`.

`fj` reports the fork version, for example `fj version` prints
`fj v0.7.0-cloudiful.1`; it follows this tap's release, not the upstream
version. The `fj` formula conflicts with the `forgejo-cli` formula because both
install an `fj` executable, so uninstall one before installing the other.

## Upgrade

```sh
brew upgrade cloudiful/tap/phasegent
brew upgrade cloudiful/tap/git-ai-commit
brew upgrade cloudiful/tap/prompt-ferry
brew upgrade cloudiful/tap/fj
```

## Platform support

| Formula | Platform | Support |
| --- | --- | --- |
| phasegent | macOS ARM64 (Apple Silicon) | Supported |
| phasegent | Linux x86_64, Linux ARM64 | Supported |
| phasegent | Intel Mac | Not supported; no Intel build is published |
| git-ai-commit | macOS ARM64 (Apple Silicon) | Supported |
| git-ai-commit | Linux x86_64, Linux ARM64 | Supported |
| git-ai-commit | Intel Mac | Not supported; no Intel build is published |
| prompt-ferry | macOS ARM64 (Apple Silicon) | Supported |
| prompt-ferry | Linux x86_64, Linux ARM64 | Supported; requires glibc 2.39+ |
| prompt-ferry | Intel Mac | Not supported; no Intel build is published |
| fj | macOS ARM64 (Apple Silicon) | Supported; requires `openssl@3` at the standard `/opt/homebrew` prefix |
| fj | Linux x86_64, Linux ARM64 | Supported; requires glibc 2.39+, system OpenSSL 3, and zlib |
| fj | Intel Mac, Windows | Not supported; no build is published |

The `prompt-ferry` Linux binaries require glibc 2.39 or newer. Intel Macs are
not supported because no Intel macOS build is published.

The `fj` Linux binaries load the system `libssl.so.3`, `libcrypto.so.3`, and
`libz.so.1`; Homebrew's `openssl@3` keg does not satisfy those loader paths. The
`fj` macOS binary links `/opt/homebrew/opt/openssl@3`, so a custom Homebrew
prefix is not supported.
