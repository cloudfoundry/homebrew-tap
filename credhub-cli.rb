#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.53"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.53/credhub-darwin-arm64-2.9.53.tgz"
      sha256 "ee46fb4f4b055019c07e7fcee9e43f2a6249f1447eb1b86a22c77fbf97dcf93c"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.53/credhub-darwin-amd64-2.9.53.tgz"
      sha256 "6742ac642c44851a9eb0f7f689fd782b0309986d95712eb8637075f9c886d6cd"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.53/credhub-linux-amd64-2.9.53.tgz"
    sha256 "2863a19634f24eea71171cfecaca1499550a75a9564f40a6787c72522028f121"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
