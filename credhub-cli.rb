#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.33"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.33/credhub-darwin-arm64-2.9.33.tgz"
      sha256 "3b64d56a72d719e95ede79840221ac5107b915eead180f9057af79af805ae413"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.33/credhub-darwin-amd64-2.9.33.tgz"
      sha256 "3163a1d318a981a3411de39a309c0c7c7da59002fc1ab4f22df2a5bcd55581a1"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.33/credhub-linux-amd64-2.9.33.tgz"
    sha256 "4d738e56b988e4228e493405f0a8d18bce8bfc7ec7e624e4536885d46b8c00a6"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
