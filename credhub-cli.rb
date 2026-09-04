#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.61"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.61/credhub-darwin-arm64-2.9.61.tgz"
      sha256 "1f211cb4fe92cf2380e09fdab209696cada1c1d05d92b3af1606c17ec50795c4"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.61/credhub-darwin-amd64-2.9.61.tgz"
      sha256 "7d13cfeed54e75ba15dd9b06fe3e8a441af754e0b3c41af7f0836998c1406ef8"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.61/credhub-linux-amd64-2.9.61.tgz"
    sha256 "4d37398135faa631755928ca25abdc3931a6465b6590b2842ab14c4d701d6c6d"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
