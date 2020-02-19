Cloud Foundry Homebrew Tap
===
This is the repository for Cloud Foundry [Homebrew](http://brew.sh/) packages. Homebrew is "the missing package manager for OS X".

To install a package:

```
brew tap cloudfoundry/tap
brew install <cf-cli | bosh-init | bosh-cli | credhub-cli | bbl | bbr>
```

Available packages:

| Package     | Description                                                |
|:------------|:-----------------------------------------------------------|
| cf-cli      | The official Cloud Foundry CLI                             |
| bosh-init   | The official CLI to create and update the BOSH Director VM |
| bosh-cli    | The official new BOSH CLI                                  |
| credhub-cli | The official CredHub CLI                                   |
| bbl         | The official bosh-bootloader CLI                           |
| bbr         | The official BOSH Backup and Restore CLI                   |

Want to change something?
 1. Make a PR
 1. A Pivotal Tracker story will be created in the Toolsmiths tracker project
 1. Toolsmiths will move the story to the team who has the most context on the changes, the 'reviewing team'
 1. The 'reviewing team' will decide the best action to take, including merging/closing/editing the PR
