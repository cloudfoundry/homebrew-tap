#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.57"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.57/credhub-darwin-arm64-2.9.57.tgz"
      sha256 "9363dda7bda0807e933e8a4f738cda0220a39ff85f426075dcce6d652d1f5b57"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.57/credhub-darwin-amd64-2.9.57.tgz"
      sha256 "6a45ec4a1c2b841a98cb51f5e1e95168d381c990a66caef891e5aa7155b4c640"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.57/credhub-linux-amd64-2.9.57.tgz"
    sha256 "c101391e13be84b1c0d8854559b99d3183535ad0398e5f28e793f3f029c34843"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
