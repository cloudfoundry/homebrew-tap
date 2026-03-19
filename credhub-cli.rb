#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.55"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.55/credhub-darwin-arm64-2.9.55.tgz"
      sha256 "3c4b211c407c253d6b13dbd7dd0b52b47c53811de911c060a61ef4820d52a874"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.55/credhub-darwin-amd64-2.9.55.tgz"
      sha256 "70902ca18b4ac516003a208845497e920b2d2970057808d78a61fc7a9d0678b0"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.55/credhub-linux-amd64-2.9.55.tgz"
    sha256 "322a427b002f18bdf031a4e7be1a0bac767860f0eec6024d78cfa8e17aa2f8b6"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
