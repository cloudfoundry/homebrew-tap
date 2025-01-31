#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.42"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.42/credhub-darwin-arm64-2.9.42.tgz"
      sha256 "3a697c660b0e2380a3fdfe350af71afd6d890aa78c27251de620926b148d3ad3"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.42/credhub-darwin-amd64-2.9.42.tgz"
      sha256 "fa4dffd755b4b8dbcf1579d3efcab35c4a065d563bee17e2781545d911c2a72e"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.42/credhub-linux-amd64-2.9.42.tgz"
    sha256 "9543b042817f9442ef5ed16b65a0839c8aa14c4db3b54076df798bbc8b6182c3"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
