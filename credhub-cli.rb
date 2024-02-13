#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.26"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.26/credhub-darwin-arm64-2.9.26.tgz"
      sha256 "81080515c3c576aeb454606ded81f8674fdd3a075e626bb650ef86c75bbd6b81"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.26/credhub-darwin-amd64-2.9.26.tgz"
      sha256 "099fcfbe70ba8540cc26da24289d97c9f83ef86202c16a4046b5deb22d5715cf"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.26/credhub-linux-amd64-2.9.26.tgz"
    sha256 "7742bff21307ad224438769079abfa2876b9a8b8d363446b26b42a07e77e06d3"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
