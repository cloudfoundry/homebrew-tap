#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.62"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.62/credhub-darwin-arm64-2.9.62.tgz"
      sha256 "57fd3d4be5a8f812e9cd786dbee25f1dc28556ac6af342bbf1e6ffb76f341c6f"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.62/credhub-darwin-amd64-2.9.62.tgz"
      sha256 "6a82f6f5496496790db68ba2ff5facf409361e48b3804d01e3ce626d886acd4b"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.62/credhub-linux-amd64-2.9.62.tgz"
    sha256 "1b933e23d8a531b31ac802fa16d7479e029ac07c6c2598f06a01182ce5fe1001"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
