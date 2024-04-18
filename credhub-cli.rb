#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.29"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.29/credhub-darwin-arm64-2.9.29.tgz"
      sha256 "4bcc2a6ce4aad81b251edc9c7d8156093eb26aec2709437fed8cebd71baa90b1"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.29/credhub-darwin-amd64-2.9.29.tgz"
      sha256 "06fce9972cf4cb86629c8740f46bf536fcf9c809fbb2f151a8f7a8afd9206300"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.29/credhub-linux-amd64-2.9.29.tgz"
    sha256 "6fd3a8c46d9a51b8444795d5585eaa0380351dda81a19459491ebec3470d0cae"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
