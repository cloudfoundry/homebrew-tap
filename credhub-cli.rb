#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.63"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.63/credhub-darwin-arm64-2.9.63.tgz"
      sha256 "fa34409b78538c90acfb1a90aa53c6fce6b8e5696aeffc0c911a2d0e85ac59ef"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.63/credhub-darwin-amd64-2.9.63.tgz"
      sha256 "1499bdfb88bd28adcf060c0431b4a84b113b0527f1f4d2125b0f60a1c6a26154"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.63/credhub-linux-amd64-2.9.63.tgz"
    sha256 "960138e04802da27f1eb56f339b168e309d16348fd82e434d25c3ae258cd64d1"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
