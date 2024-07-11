#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.34"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.34/credhub-darwin-arm64-2.9.34.tgz"
      sha256 "f7297858c723d229e1f79029bc199c09dd764b1ea7881f15aacc8dd8fdb7eeef"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.34/credhub-darwin-amd64-2.9.34.tgz"
      sha256 "cc6519f2df8bed2d7d1bb5b77d8e8dd84956477078401eccad8a73707b96d9e0"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.34/credhub-linux-amd64-2.9.34.tgz"
    sha256 "eb705eff9f9724e7faa470cb55504e5f582c8c0faa09815229a186c1f064b14e"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
