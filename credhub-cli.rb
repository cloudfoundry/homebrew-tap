#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.48"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.48/credhub-darwin-arm64-2.9.48.tgz"
      sha256 "8cdfc8481c2babce5d5bb96f2cd5c88ed7960da029ce6543fa7c1808a8bd99a0"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.48/credhub-darwin-amd64-2.9.48.tgz"
      sha256 "69f6e8293140611a807489acbd42b577e3aec12ca55f4a9e3df04f3ac3cd05d6"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.48/credhub-linux-amd64-2.9.48.tgz"
    sha256 "fb5d2ab2b283a70f88b2322b77d087154587d33455d6238e30ea5c94921bd0a6"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
