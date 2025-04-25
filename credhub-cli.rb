#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.45"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.45/credhub-darwin-arm64-2.9.45.tgz"
      sha256 "a163c8cbf466ec2f229380c90b529a4bea9a846e3c3d2038a295e351ec2cd7ff"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.45/credhub-darwin-amd64-2.9.45.tgz"
      sha256 "958d740186593b5b4dbd5ebc9ec58fcb3047052af422820af8c226b9c9b1714d"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.45/credhub-linux-amd64-2.9.45.tgz"
    sha256 "c1b4bf8ee21815abd6e1745e1751cbed625ffb0c6b9e9ae640dc12a05909b3dc"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
