#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.49"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.49/credhub-darwin-arm64-2.9.49.tgz"
      sha256 "bd066be6ad50ed0207b15a57adbaa337475ddcb8e458fa9e14abcef1f98a2549"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.49/credhub-darwin-amd64-2.9.49.tgz"
      sha256 "24f8628b29c65b018a8dff6458a59e37b3ce93ac0ebd2b9fd67bce085a690683"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.49/credhub-linux-amd64-2.9.49.tgz"
    sha256 "307c2e151e363251aeeb498a06cd8a284ee0a2d7e3696e526b30737df8f53caa"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
