#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.43"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.43/credhub-darwin-arm64-2.9.43.tgz"
      sha256 "da6f4a81c356e6a22996bdd8a9fe84d8c8ed96b36c9005fc2bd1d3635e2788de"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.43/credhub-darwin-amd64-2.9.43.tgz"
      sha256 "c1ce74b8366c995b34b80135cf89607e6e75f6fdcca4a1d0a2834d71250a1253"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.43/credhub-linux-amd64-2.9.43.tgz"
    sha256 "7a7edcf4b9a7c1dd49d695cecc105bfa15faa489adc9f1c96fa9fd87b7d10b46"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
