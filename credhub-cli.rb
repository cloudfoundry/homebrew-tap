#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.22"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.22/credhub-darwin-arm64-2.9.22.tgz"
      sha256 "46452c1606676a5d9d4621299464ef0a2f2e880fe8d08879d48a23ad80db04cd"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.22/credhub-darwin-amd64-2.9.22.tgz"
      sha256 "5de4d69d36cbd566648a1207d93937862a822f9ac323b6f4b96ddd9069a0a4ff"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.22/credhub-linux-2.9.22.tgz"
    sha256 "e95536e88107950a05132f9b0398db4cb774f66b9b06a884bd14d598ffc7acb8"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
