#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.51"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.51/credhub-darwin-arm64-2.9.51.tgz"
      sha256 "b61e45d0f3e334620fb2960bbadff5d42c9b342e1fcd3f4df0cc4748836b0a36"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.51/credhub-darwin-amd64-2.9.51.tgz"
      sha256 "3c636a782fa21c36606513da17a10ce5db8afcf6db3abe079b3ee9ae8b497df6"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.51/credhub-linux-amd64-2.9.51.tgz"
    sha256 "f633257aa4d5d25938765a0a347988a3cea1def3708205024aba6e13b8ad7eb9"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
