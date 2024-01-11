#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.25"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.25/credhub-darwin-arm64-2.9.25.tgz"
      sha256 "61f00b39b3f23f605c15facb50262f8d774ee65ff0c1f88b99e0705c0ea2ec76"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.25/credhub-darwin-amd64-2.9.25.tgz"
      sha256 "257d52aa42d660f30c02fe8338fcd84e10a11b1826631cc0421ef59b97bd8f99"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.25/credhub-linux-amd64-2.9.25.tgz"
    sha256 "10e549338a5a3ab8dee91981295b68182f125fdd56b2576cca07763fe0f55a07"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
