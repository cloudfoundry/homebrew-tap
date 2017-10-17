Cloud Foundry Homebrew Tap
===
This is the repository for Cloud Foundry [Homebrew](http://brew.sh/) packages. Homebrew is "the missing package manager for OS X".

To install a package:

```
brew tap cloudfoundry/tap
brew install <cf-cli | bosh-init | bosh-cli | credhub-cli | bbl>
```

Available packages:

Package|Description
---|---
cf-cli|The official Cloud Foundry CLI
bosh-init|The official CLI to create and update the BOSH Director VM
bosh-cli|The new BOSH CLI (beta), binary will be added as bosh2 to avoid conflicts with the old CLI
credhub-cli|The official CredHub CLI
bbl|The official bosh-bootloader CLI
