#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.35"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.35/credhub-darwin-arm64-2.9.35.tgz"
      sha256 "276d105de4321140f3f56781b6348ebefce3dfd93f5471d8ac7f7a1813407b13"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.35/credhub-darwin-amd64-2.9.35.tgz"
      sha256 "80a97180a3ac020b352a1c1f8b1737128f416616a0261e05a899758188b3278c"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.35/credhub-linux-amd64-2.9.35.tgz"
    sha256 "2d48df4b2a45336ab6f85dcdf4999e627439aec63871326bf7a5003b33677497"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
