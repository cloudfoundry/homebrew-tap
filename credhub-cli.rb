#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.39"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.39/credhub-darwin-arm64-2.9.39.tgz"
      sha256 "83025673754c0dfebac9bfbf3499d4ced5e1767ff0b9815bcd4695f2214217f3"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.39/credhub-darwin-amd64-2.9.39.tgz"
      sha256 "d91b3a5811d8d4c5213628339c971e1ff010577d27b424ca1f121cc892c819ea"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.39/credhub-linux-amd64-2.9.39.tgz"
    sha256 "15cb96ea05a85020c83ef81d7a72f7da43a8671f8e60ed3f7ddc6660a0c83b2e"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
