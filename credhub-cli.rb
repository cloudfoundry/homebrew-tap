#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.56"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.56/credhub-darwin-arm64-2.9.56.tgz"
      sha256 "c4cf71214c08dbd36580da15dbb31d0b59e171389c7753bffc9f8988e2299be1"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.56/credhub-darwin-amd64-2.9.56.tgz"
      sha256 "8ebb3a3cfa382101c1998ceb0eadbc24187cd52bb3138b830b4cb8d2c2c4e342"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.56/credhub-linux-amd64-2.9.56.tgz"
    sha256 "da006a109fccddc900048001753dab81d1dbd2160bb48aab2643c944522a3933"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
