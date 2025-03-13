#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.44"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.44/credhub-darwin-arm64-2.9.44.tgz"
      sha256 "6f70cd9f16599f30a48d8e7e1ea803ee2389f1ceb23b018e621d7e537662a88f"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.44/credhub-darwin-amd64-2.9.44.tgz"
      sha256 "3c55df71aac2e0d77482bb909a89803f3d9b4b4fc1082dd9ff6636f1f3b1250e"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.44/credhub-linux-amd64-2.9.44.tgz"
    sha256 "6fc2f717c5ce074141b35ab0fd89e1eb6b190e5f20fe31536a782764510ac5b1"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
