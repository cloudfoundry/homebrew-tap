#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.46"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.46/credhub-darwin-arm64-2.9.46.tgz"
      sha256 "ed7222b113a367b86b0e0688c60c6e1fa44d12dc89792e066f13e8b829e97ba3"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.46/credhub-darwin-amd64-2.9.46.tgz"
      sha256 "8e635c7da2c2131faf7e437b8dce665f983c8953a3f5e57ee9f1e2534c59057b"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.46/credhub-linux-amd64-2.9.46.tgz"
    sha256 "2e783a11a0b8c4f079c42b9f741da701a53ec093effa1fb679b730af4a9f07dd"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
