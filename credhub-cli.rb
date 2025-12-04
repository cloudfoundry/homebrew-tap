#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.52"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.52/credhub-darwin-arm64-2.9.52.tgz"
      sha256 "b3560381d343a86f95e0f083a6dde21a29be058dd895941954d0aca06a6f9bc5"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.52/credhub-darwin-amd64-2.9.52.tgz"
      sha256 "e6f3c5d173c08edc03eb808d7febd7720967c5d765227e894d15212cafc923a1"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.52/credhub-linux-amd64-2.9.52.tgz"
    sha256 "8e0bc2f1d9a69b41d59036ee5469c34a9ee647c217a64618afa302bd7b57ff8f"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
