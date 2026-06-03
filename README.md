# Cloud Foundry Homebrew Tap

This is the repository for Cloud Foundry [Homebrew](http://brew.sh/) packages. Homebrew is "The Missing Package Manager for macOS (or Linux)".

## Available packages:

| Package        | Type    | Description                              |
|:---------------|:--------|:-----------------------------------------|
| cf-cli@{6,7,8} | formula | The official Cloud Foundry CLI           |
| bosh-cli       | formula | The official new BOSH CLI                |
| credhub-cli    | formula | The official CredHub CLI                 |
| bbl            | formula | The official bosh-bootloader CLI         |
| bbr            | formula | The official BOSH Backup and Restore CLI |
| uaa-cli        | cask    | CLI for UAA, written in Go               |

## Installation

### To install a package, via formula:

Most packages are available as formula, which can be installed with:

```bash
brew install --formula cloudfoundry/tap/<bbl | bbr | bosh-cli | cf-cli@8 | cf-cli@7 | cf-cli@6 | cf-cli  |credhub-cli >
```

### To install a package, via Cask:

The UAA CLI is available via Cask, which can be installed with:

```bash
brew install --cask cloudfoundry/tap/uaa-cli
```

If upgrading from the old formula-based version, uninstall it first
```bash
brew uninstall --force uaa-cli
```

## Install All Packages

To install all packages, run:

```bash
brew trust cloudfoundry/tap
brew install --formula cloudfoundry/tap/bbl 
brew install --formula cloudfoundry/tap/bbr
brew install --formula cloudfoundry/tap/bosh-cli
brew install --formula cloudfoundry/tap/cf-cli@8
brew install --formula cloudfoundry/tap/credhub-cli
brew install --cask cloudfoundry/tap/uaa-cli
```

### Troubleshooting Installation

If you encounter trust warnings with Homebrew, you can trust the tap:
```bash
brew trust cloudfoundry/tap
```

## Contributing

Want to change something?
 1. Make a PR
 2. The 'reviewing team' will decide the best action to take, including merging/closing/editing the PR
