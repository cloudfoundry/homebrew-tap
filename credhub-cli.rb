#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.58"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.58/credhub-darwin-arm64-2.9.58.tgz"
      sha256 "0f9d1d08736c3b92ae8f15b81ef15a03340f9fd68adaf3b4a979d53e18a3411a"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.58/credhub-darwin-amd64-2.9.58.tgz"
      sha256 "c7b39d8688c13a8a8725527a008bacba375382e95171784caef848470bdc8945"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.58/credhub-linux-amd64-2.9.58.tgz"
    sha256 "407080ca1e2a1c76b0f102edd0a2e1605731e43d3c38caf79d1e007cf3bd2ac7"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
