#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.24"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.24/credhub-darwin-arm64-2.9.24.tgz"
      sha256 "719364fd8dc7671e687fc00ff251f1fcc7d21ed98674bd3af917f27e7f6a4379"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.24/credhub-darwin-amd64-2.9.24.tgz"
      sha256 "61204aa7b80b72daaaa8c3140378ac91a2c31d94806719aa7869cef7678f1e86"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.24/credhub-linux-amd64-2.9.24.tgz"
    sha256 "026b07fe91d55e3d562e7cdbcabb92b0cd4712ef4017d632c7d3dd07559ee63e"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
