#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.27"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.27/credhub-darwin-arm64-2.9.27.tgz"
      sha256 "0effff0c9ecbd3fce4bfc6a9deaea577d9fde9a5ce5d1e25be35198a370e77e5"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.27/credhub-darwin-amd64-2.9.27.tgz"
      sha256 "36d10547ea34947cbb45b3a124e1a1bf1aa6afeb0ebb504a202d7106f33d2d99"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.27/credhub-linux-amd64-2.9.27.tgz"
    sha256 "d8340c2d74a16a949b293e1228115aed3a5b7815a90372e38555454477ba5309"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
