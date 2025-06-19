#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.47"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.47/credhub-darwin-arm64-2.9.47.tgz"
      sha256 "aed4a6652502e15434fea13d8b1deb8cfad4c2eca58040605924a290d771ed62"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.47/credhub-darwin-amd64-2.9.47.tgz"
      sha256 "6b17c1c2b0cd4411bdc3209d302da4e15da512b3c56ed33e24c0af5310098e98"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.47/credhub-linux-amd64-2.9.47.tgz"
    sha256 "39cf7dfb2bde3285d3a4cb859f1573b3882796fcc008fa8df91e2eb4699e7e5b"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
